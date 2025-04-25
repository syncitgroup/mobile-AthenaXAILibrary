//
//  AthenaProductsListDataDTO.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 23.4.25..
//

import Foundation

public struct AthenaProductsListDataDTO: Codable {
    public let products: AthenaProductsDataDTO?
    public let modes: [AthenaModeDTO]?
    public let blog: AthenaBlogDTO?
    public let banners: [AthenaBannerDTO]?
    public let query: String?
    public let suggestedText: String?
    public let usedSuggestions: Bool?
    public let currentUrl: String?
    public let currentPath: String?
    public let isSeoEnabled: Bool?
    public let imageCache: String?
    public let bestMatchSize: Int?
    
    private enum CodingKeys: String, CodingKey {
        case products = "products"
        case modes = "modes"
        case blog = "blog"
        case banners = "banners"
        case query = "query"
        case suggestedText = "suggested_text"
        case usedSuggestions = "used_suggestions"
        case currentUrl = "current_url"
        case currentPath = "current_path"
        case isSeoEnabled = "is_seo_enabled"
        case imageCache = "image_cache"
        case bestMatchSize = "best_match_size"
    }
}
