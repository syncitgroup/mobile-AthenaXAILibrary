//
//  AthenaConfiguration.swift
//  AthenaXAI
//
//  Created by Nemanja Cvetkovic on 22.4.25..
//

import Foundation

class AthenaConfiguration {
    static let shared = AthenaConfiguration()
    
    private let apiExtension = "/api/v2/"
    
    var config: AthenaNetworkConfigurable?
    var accessToken: String?
    var token: String?
    
    init() {
//        var serverUrl = athenaWebsiteUrl
//        if serverUrl.last == "/" {
//            serverUrl.removeLast()
//        }
//        guard let url = URL(string: serverUrl) else  {
//            config = AthenaApiDataNetworkConfig(baseURL: nil, apiExtension: apiExtension, headers: [:], mediaURL: nil)
//            return
//        }
//        config = AthenaApiDataNetworkConfig(baseURL: url,
//                                             apiExtension: apiExtension,
//                                             headers: [:],
//                                             mediaURL: url)
    }
    
    func setupConfig(athenaWebsiteUrl: String, accessToken: String, token: String) {
        var serverUrl = athenaWebsiteUrl
        if serverUrl.last == "/" {
            serverUrl.removeLast()
        }
        guard let url = URL(string: serverUrl) else  {
            config = AthenaApiDataNetworkConfig(baseURL: nil, apiExtension: apiExtension, headers: [:], mediaURL: nil)
            return
        }
        config = AthenaApiDataNetworkConfig(baseURL: url,
                                             apiExtension: apiExtension,
                                             headers: [:],
                                             mediaURL: url)
        
        self.accessToken = accessToken
        self.token = token
    }
}
