//
//  ProductsSearchRequest.swift
//  AthenaXAI
//
//  Created by Nemanja Cvetkovic on 1.11.23..
//

import Foundation

public class ProductsSearchRequest: Codable {
    var token: String
    var category: String
    var level: String
    public var product_list_limit: String = "40"
    public var page: String?
    var customer_group_id: String
//    public var campaign_id: String?
//    public var utm_campaing: String?
    
    public init(token: String, category: String, level: String, customerGroupId: String) {
        self.token = token
        self.category = category
        self.level = level
        self.customer_group_id = customerGroupId
    }
    
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}
