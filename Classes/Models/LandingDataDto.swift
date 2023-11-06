//
//  LandingDataDto.swift
//  AthenaSearch
//
//  Created by Ana Stojkovic on 26/7/23.
//

import Foundation

public struct LandingDataDto: Codable {
    public let products: ProductsDto?
    public let sections: DataObject?
    let modes: [ModeDto]?
    let query: String?
    let suggestedText: String?
    let usedSuggestions: Bool?
    let currentURL: String?
    let currentPath: String?
    let blog: ProductsDto?
//    let banners: [String: String]?
    let imageCache: String?
    
    enum CodingKeys: String, CodingKey {
        case products, modes, query, blog, banners
        case suggestedText = "suggested_text"
        case usedSuggestions = "used_suggestions"
        case currentURL = "current_url"
        case currentPath = "current_path"
        case imageCache = "image_cache"
    }
}
