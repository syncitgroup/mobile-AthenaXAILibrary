//
//  SearchConfigurableOptionDto.swift
//  AthenaSearch
//
//  Created by Ana Stojkovic on 27/7/23.
//

import Foundation

public struct SearchConfigurableOptionDto: Codable {
    public let attributeId: Int?
    public let attributeCode: String?
    public let options: [SearchOptionDto]?
    
    enum CodingKeys: String, CodingKey {
        case attributeId = "attribute_id"
        case attributeCode = "attribute_code"
        case options
    }
}

public  struct SearchOptionDto: Codable {
    public let optionId: String?
    public let optionLabel: String?
    public let hashCode: String?
    public let optionType: String?
    public let seoValue: String?
    
    enum CodingKeys: String, CodingKey {
        case optionId = "option_id"
        case optionLabel = "option_label"
        case hashCode = "hash_code"
        case optionType = "option_type"
        case seoValue = "seo_value"
    }
}

public  struct ProductCombinationDto: Codable {
    public let colorShade: String?
    
    enum CodingKeys: String, CodingKey {
        case colorShade = "color_shade"
    }
}
