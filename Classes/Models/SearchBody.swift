//
//  SearchBody.swift
//  AthenaSearch
//
//  Created by Ana Stojkovic on 25/8/23.
//

import Foundation

public class SearchBody: Codable {
    var q: String?
    var token: String
    var in_results_array: Bool = true
    var customer_group_id: String?
    
    public init(token: String, q: String, customerId: String) {
        self.token = token
        self.q = q
        self.customer_group_id = customerId
    }
    
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}
