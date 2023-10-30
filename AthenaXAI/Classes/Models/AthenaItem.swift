//
//  AthenaItem.swift
//  AthenaSearch
//
//  Created by Ana Stojkovic on 25/8/23.
//

import Foundation

public class AthenaItem: Codable {
    public var items: [SearchItem]? = [SearchItem]()
    public var title: String?
    public var type: ResultType?
    
    init(type: ResultType?) {
        self.type = type
    }
    
    enum CodingKeys: String, CodingKey, Codable {
        case items
        case title
    }
}
