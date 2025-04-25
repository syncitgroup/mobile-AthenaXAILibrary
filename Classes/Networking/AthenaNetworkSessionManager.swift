//
//  AthenaNetworkSessionManager.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 22.4.25..
//

import Foundation

protocol AthenaNetworkSessionManager {
    func request(endpoint: any AthenaEndPointType) async throws -> (Data?, URLResponse?)
}

final class DefaultAthenaNetworkSessionManager: AthenaNetworkSessionManager {
    private let session: AthenaURLSessionProtocol
    private let requestGenerator: AthenaURLRequestGenerator
    
    init(session: AthenaURLSessionProtocol = AthenaSharedURLSession.shared, requestGenerator: AthenaURLRequestGenerator = DefaultAthenaURLRequestGenerator()) {
        self.session = session
        self.requestGenerator = requestGenerator
    }
    
    func request(endpoint: any AthenaEndPointType) async throws -> (Data?, URLResponse?) {
        let urlRequest = try requestGenerator.generateURLRequest(from: endpoint)
        do {
            return try await session.asyncData(for: urlRequest)
        } catch {
            throw AthenaNetworkError.resolve(error: error)
        }
    }
}
