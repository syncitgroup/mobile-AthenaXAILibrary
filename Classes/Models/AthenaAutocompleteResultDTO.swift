//
//  AthenaAutocompleteResultDTO.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 23.4.25..
//

import Foundation

public struct AthenaAutocompleteResultDTO: Codable {
    public let product: AthenaAutocompleteItemDTO?
    public let category: AthenaAutocompleteItemDTO?
    public let sectionA: AthenaAutocompleteItemDTO?
    public let sectionB: AthenaAutocompleteItemDTO?
    public let popular: AthenaAutocompleteItemDTO?
    public let recentSearches: AthenaAutocompleteItemDTO?
//    let blogPost: AutocompleteItemDTO?
//    let blogCategory: AutocompleteItemDTO?
//    let pdfDocuments: AutocompleteItemDTO?
    
    private enum CodingKeys: String, CodingKey {
        case product
        case category
        case sectionA = "section_a"
        case sectionB = "section_b"
        case popular
        case recentSearches = "recent_searches"
//        case blogPost = "blog_post"
//        case blogCategory = "blog_category"
//        case pdfDocuments = "pdf_documents"
    }
}
