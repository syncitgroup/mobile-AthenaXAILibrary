//
//  ResultType.swift
//  AthenaSearch
//
//  Created by Ana Stojkovic on 25/8/23.
//

import Foundation

public enum ResultType: String, Codable {
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
//    case firstSectionA = "first-section_a"
//    case firstSectionB = "first-section_b"
    case unknown
}
