//
//  PopularSearchAthenaItem.swift
//  Alamofire
//
//  Created by Nemanja Cvetkovic on 13.11.23..
//

import Foundation

public class PopularSearchAthenaItem: AthenaItem {
    
    init() {
        super.init(type: .category)
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try? container.decode([SearchItem].self, forKey: .items)
        self.title = try? container.decode(String.self, forKey: .title)
        self.type = .popular
    }
    
    enum CodingKeys: String, CodingKey, Codable {
        case items
        case title
    }
}
