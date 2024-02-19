//
//  BrandDto.swift
//  AthenaSearch
//
//  Created by Ana Stojkovic on 26/7/23.
//

import Foundation

public struct BrandDto: Codable {
    public let optionID: String?
    public let id: Int?
    public let label: String?
    public let attributeCode: String?
    
    enum CodingKeys: String, CodingKey {
        case optionID = "option_id"
        case id, label
        case attributeCode = "attribute_code"
    }
}
