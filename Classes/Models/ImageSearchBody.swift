//
//  ImageSearchBody.swift
//  AthenaSearch
//
//  Created by Ana Stojkovic on 25/7/23.
//

import Foundation

public class ImageSearchBody: Codable {
    public var token: String
    public var image: String?
    public var search: Int = 0
    public var customer: String?
    public var page: String?
    public var customer_group_id: String
    
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
