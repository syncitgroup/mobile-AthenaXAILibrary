//
//  AthenaAutocompleteItemDTO.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 23.4.25..
//

import Foundation

public struct AthenaAutocompleteItemDTO: Codable {
    public let items: [AthenaSearchItemDTO]?
    public let title: String?
    public let position: Int?
    public let type: String?
    
    public var resultType: AthenaResultType {
        .init(rawValue: type ?? "") ?? .unknown
    }
}

public enum AthenaResultType: String, Codable {
    case popular
    case product
    case category
    case firstPopular = "first-popular"
    case firstProduct = "first-product"
    case blogPost = "blog_post"
    case blogCategory = "blog_category"
    case sectionA = "section_a"
    case sectionB = "section_b"
    case bannerTop = "banner_top"
    case bannerBottom = "banner_bottom"
    case firstSectionA = "first-section_a"
    case firstSectionB = "first-section_b"
    case recentSearches = "recent_searches"
    case unknown
}
