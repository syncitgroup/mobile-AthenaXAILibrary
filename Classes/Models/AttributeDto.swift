//
//  AttributeDto.swift
//  AthenaSearch
//
//  Created by Ana Stojkovic on 26/7/23.
//

import Foundation

public struct AttributeDto: Codable {
    public let seoURL: String?
    public let hashCode: String?
    public let originalValue: String?
    public let name: String?
    public let label: String?
    public let value: String?
    public let parent: String?
    public let originalParent: String?   
    
    enum CodingKeys: String, CodingKey {
        case seoURL = "seo_url"
        case hashCode = "hash_code"
        case originalValue = "original_value"
        case name, label, value, parent
        case originalParent = "original_parent"
    }
}
