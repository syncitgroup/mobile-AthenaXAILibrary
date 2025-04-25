//
//  AthenaURLSessionProtocol.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 22.4.25..
//

import Foundation

protocol AthenaURLSessionProtocol {
    func asyncData(for request: URLRequest) async throws -> (Data?, URLResponse?)
}

extension URLSession: AthenaURLSessionProtocol {
    func asyncData(for request: URLRequest) async throws -> (Data?, URLResponse?) {
        return try await self.data(for: request)
    }
}
