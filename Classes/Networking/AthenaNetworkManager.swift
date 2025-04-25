//
//  AthenaNetworkManager.swift
//  AthenaXAI
//
//  Created by Nemanja Cvetkovic on 22.4.25..
//

import Foundation

protocol AthenaNetworkManager {
    func fetch(endpoint: any AthenaEndPointType) async throws -> Data
}

struct ErrorMessage: Codable {
    let message: String?
}

final class DefaultAthenaNetworkManager: AthenaNetworkManager {
    private let sessionManager: AthenaNetworkSessionManager
    
    init(sessionManager: AthenaNetworkSessionManager = DefaultAthenaNetworkSessionManager()) {
        self.sessionManager = sessionManager
    }
    
    func fetch(endpoint: any AthenaEndPointType) async throws -> Data {
        let (data, response) = try await sessionManager.request(endpoint: endpoint)
        guard let response = response as? HTTPURLResponse else {
            throw AthenaNetworkError.noResponse
        }
        
        if response.statusCode == 401 {
            throw AthenaNetworkError.failed
        } else if response.statusCode == 400 {
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(ErrorMessage.self, from: data)
                    throw AthenaNetworkError.custom(decodedData.message ?? "")
                } catch {
                    throw AthenaNetworkError.unableToDecode
                }
            }
        } else if response.statusCode != 200 {
            do {
                if let data = data {
                    do {
                        let decodedData = try JSONDecoder().decode(ErrorMessage.self, from: data)
                        throw AthenaNetworkError.custom(decodedData.message ?? "")
                    } catch {
                        throw AthenaNetworkError.unableToDecode
                    }
                }
            }
            throw AthenaNetworkError.failed
        }
        
        guard let data = data else {
            throw AthenaNetworkError.noData
        }
        
        if let allHeaderFields = response.allHeaderFields as? [String : String] {
            let cookies = HTTPCookie.cookies(withResponseHeaderFields: allHeaderFields, for: response.url!)
            HTTPCookieStorage.shared.setCookies(cookies, for: response.url!, mainDocumentURL: nil)
        }
        
        return data
    }
}
