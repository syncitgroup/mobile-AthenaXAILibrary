//
//  AthenaAPIClientService.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 22.4.25..
//

import Foundation

protocol AthenaAPIClientService {
    func request<T: Decodable>(endpoint: any AthenaEndPointType<T>) async throws -> T
}

final class DefaultAthenaAPIClientService: AthenaAPIClientService {
    private let networkManager: AthenaNetworkManager
    
    init(networkManager: AthenaNetworkManager) {
        self.networkManager = networkManager
    }
    
    func request<T>(endpoint: any AthenaEndPointType<T>) async throws -> T where T : Decodable {
        let data = try await networkManager.fetch(endpoint: endpoint)
        do {
            if T.self == Data.self || T.self == Data?.self {
                return data as! T
            }
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            throw AthenaNetworkError.unableToDecode
        }
    }
}
