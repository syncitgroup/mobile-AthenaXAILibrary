//
//  AthenaNetworkError.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 22.4.25..
//

import Foundation

enum AthenaNetworkError: Error, Equatable {
    case badURL
    case badHostName
    case badRequest
    case failed
    case noResponse
    case noData
    case unableToDecode
    case unableToEncode
    case notConnected
    case generic
    case custom(_: String)
    
    var description: String {
        switch self {
        case .badURL:
            return "Bad URL"
        case .badHostName:
            return "A server with the specified hostname could not be found"
        case .badRequest:
            return "Bad request"
        case .failed:
            return "Network Request Failed"
        case .noResponse:
            return "No response"
        case .noData:
            return "No Data"
        case .unableToDecode:
            return "Response can't be decoded"
        case .unableToEncode:
            return "Data can't be encoded"
        case .notConnected:
            return "The internet connection appears to be offline"
        case .generic:
            return "Something went wrong"
        case .custom(let message):
            return message
        }
    }
    
    static func resolve(error: Error) -> AthenaNetworkError {
        let code = URLError.Code(rawValue: (error as NSError).code)
        
        switch code {
        case .notConnectedToInternet: return .notConnected
        case .cannotFindHost: return .badHostName
        default: return .generic
        }
    }
}
