//
//  AthenaAPIEndpoint.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 22.4.25..
//

import Foundation

enum AthenaHTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum AthenaRequestHeaderType: String {
    case athenaAuthorized
}

protocol AthenaEndPointType<Response> {
    associatedtype Response
    
    var path: String {get set}
    var isIncludeApiPath: Bool { get }
    var method: AthenaHTTPMethod {get set}
    var headerParameters: [String: String] {get set}
    var queryParameters: [String: Any] {get set}
    var bodyParameters: [String: Any] {get set}
    var bodyParametersEncodable: Encodable? {get set}
    var requestHeaderType: AthenaRequestHeaderType {get set}
}

final class AthenaAPIEndpoint<R>: AthenaEndPointType {
    typealias Response = R
    
    var path: String
    var isIncludeApiPath: Bool
    var method: AthenaHTTPMethod
    var headerParameters: [String : String]
    var queryParameters: [String : Any]
    var bodyParameters: [String : Any]
    var bodyParametersEncodable: Encodable?
    var requestHeaderType: AthenaRequestHeaderType
    init(path: String,
         isIncludeApiPath: Bool = true,
         method: AthenaHTTPMethod = .get,
         headerParameters: [String : String] = [:],
         queryParameters: [String : Any] = [:],
         bodyParameters: [String : Any] = [:],
         bodyParametersEncodable: Encodable? = nil,
         endpointType: AthenaRequestHeaderType = .athenaAuthorized) {
        self.path = path
        self.isIncludeApiPath = isIncludeApiPath
        self.method = method
        self.headerParameters = headerParameters
        self.queryParameters = queryParameters
        self.bodyParameters = bodyParameters
        self.bodyParametersEncodable = bodyParametersEncodable
        self.requestHeaderType = endpointType
    }
}
