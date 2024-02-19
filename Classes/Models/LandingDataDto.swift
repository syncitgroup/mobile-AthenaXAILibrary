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
    public let modes: [ModeDto]?
    public let query: String?
    public let suggestedText: String?
    public let usedSuggestions: Bool?
    public let currentURL: String?
    public let currentPath: String?
    public let blog: ProductsDto?
    public let banners: Banner?
    public let imageCache: String?
    
    enum CodingKeys: String, CodingKey {
        case products, modes, query, blog, sections, banners
        case suggestedText = "suggested_text"
        case usedSuggestions = "used_suggestions"
        case currentURL = "current_url"
        case currentPath = "current_path"
        case imageCache = "image_cache"
    }
}
