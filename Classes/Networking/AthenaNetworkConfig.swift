//
//  AthenaNetworkConfig.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 22.4.25..
//

import Foundation

protocol AthenaNetworkConfigurable {
    var baseURL: URL? { get }
    var apiExtension : String { get }
    var headers: [String : String] { get }
    var mediaURL: URL? { get }
}

class AthenaApiDataNetworkConfig: AthenaNetworkConfigurable {
    let baseURL: URL?
    let apiExtension: String
    let headers: [String : String]
    let mediaURL: URL?
    
    init(baseURL: URL?, apiExtension: String, headers: [String : String] = [:], mediaURL: URL?) {
        self.baseURL = baseURL
        self.apiExtension = apiExtension
        self.headers = headers
        self.mediaURL = mediaURL
    }
}
