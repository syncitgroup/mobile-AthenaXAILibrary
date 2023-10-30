//
//  AttributeDto.swift
//  AthenaSearch
//
//  Created by Ana Stojkovic on 26/7/23.
//

import Foundation

public struct AttributeDto: Codable {
    let seoURL: String?   
    let hashCode: String?   
    let originalValue: String?   
    let name: String?   
    let label: String?   
    let value: String?   
    let parent: String?   
    let originalParent: String?   
    
    enum CodingKeys: String, CodingKey {
        case seoURL = "seo_url"
        case hashCode = "hash_code"
        case originalValue = "original_value"
        case name, label, value, parent
        case originalParent = "original_parent"
    }
}
