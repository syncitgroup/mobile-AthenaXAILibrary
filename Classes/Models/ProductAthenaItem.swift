//
//  ProductAthenaItem.swift
//  AthenaSearch
//
//  Created by Ana Stojkovic on 25/8/23.
//

import Foundation

public class ProductAthenaItem: AthenaItem {
    
    init() {
        super.init(type: .product)
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try? container.decode([SearchItem].self, forKey: .items)
        self.title = try? container.decode(String.self, forKey: .title)
        self.type = .product
    }
    
    enum CodingKeys: String, CodingKey, Codable {
        case items
        case title
    }
}
