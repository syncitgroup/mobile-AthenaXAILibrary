//
//  AthenaAnalyticOrderBodyDTO.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 25.4.25..
//

import Foundation

public struct AthenaAnalyticOrderBodyDTO: Codable {
    public let token: String?
    public let userToken: String?
    public let order: AthenaAnalyticOrderDTO?
    public let source: String?
    public let channel: String?
    
    public init(token: String?, userToken: String?, order: AthenaAnalyticOrderDTO?, source: String?, channel: String?) {
        self.token = token
        self.userToken = userToken
        self.order = order
        self.source = source
        self.channel = channel
    }
}
