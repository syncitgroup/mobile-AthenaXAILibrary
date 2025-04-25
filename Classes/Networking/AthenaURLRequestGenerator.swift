//
//  AthenaURLRequestGenerator.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 22.4.25..
//

import Foundation

protocol AthenaURLRequestGenerator {
    func generateURLRequest(/*with config: NetworkConfigurable, */from request: any AthenaEndPointType) throws -> URLRequest
}

final class DefaultAthenaURLRequestGenerator: AthenaURLRequestGenerator {
    func generateURLRequest(from endpoint: any AthenaEndPointType) throws -> URLRequest {
//        let config: NetworkConfigurable = AppConfiguration.shared.config
//        lazy var athenaConfig: NetworkConfigurable = AthenaConfiguration.shared.config
        let url = try createURL(from: endpoint)
        var urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy)
        urlRequest.httpMethod = endpoint.method.rawValue
        let bodyParameters = try endpoint.bodyParametersEncodable?.toDictionary() ?? endpoint.bodyParameters
        if !bodyParameters.isEmpty {
            do {
                let bodyData = try JSONSerialization.data(withJSONObject: bodyParameters, options: [.prettyPrinted])
                urlRequest.httpBody = bodyData
            } catch {
                throw error
            }
        }
        
        AthenaConfiguration.shared.config?.headers.forEach { key, value in
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
//        let accessToken = AthenaConstants.accessToken
        let accessToken = AthenaConfiguration.shared.accessToken ?? ""
        urlRequest.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("Mobile App", forHTTPHeaderField: "Client-Source")
        urlRequest.setValue("Mobile", forHTTPHeaderField: "Device")
        urlRequest.setValue("iOS", forHTTPHeaderField: "Platform")
        
        return urlRequest
    }
    
    /// Method to ceate URL
    /// - Parameters:
    ///   - config: Network Config
    ///   - request: Network Request
    /// - Returns: URL
    private func createURL(from endpoint: any AthenaEndPointType) throws -> URL {
        var components = URLComponents()
        let baseUrl = AthenaConfiguration.shared.config?.baseURL
        components.scheme = baseUrl?.scheme
        components.host = baseUrl?.host
        let basePath = baseUrl?.path ?? ""
        let path = endpoint.isIncludeApiPath ? basePath + (AthenaConfiguration.shared.config?.apiExtension ?? "") + endpoint.path : basePath + endpoint.path
        components.path = path
        if !endpoint.queryParameters.isEmpty {
            components.queryItems = endpoint.queryParameters.map { URLQueryItem(name: $0, value: "\($1)") }
        }
        guard let url = components.url else {
            throw AthenaNetworkError.badURL
        }
        
        return url
    }
}

extension Encodable {
    func toDictionary() throws -> [String: Any]? {
        let data = try JSONEncoder().encode(self)
        let josnData = try JSONSerialization.jsonObject(with: data)
        return josnData as? [String : Any]
    }
}
