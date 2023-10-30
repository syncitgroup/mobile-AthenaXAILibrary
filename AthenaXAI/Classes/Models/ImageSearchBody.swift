//
//  ImageSearchBody.swift
//  AthenaSearch
//
//  Created by Ana Stojkovic on 25/7/23.
//

import Foundation

public class ImageSearchBody: Codable {
    var token: String
    var image: String?
    var search: Int = 0
    var customer: String?
    var page: String?
    var customer_group_id: String
    
    public init(token: String, image: String, customer: String, customerGroupId: String) {
        self.token = token
        self.image = image
        self.customer = customer
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
