//
//  BrandDto.swift
//  AthenaSearch
//
//  Created by Ana Stojkovic on 26/7/23.
//

import Foundation

public struct BrandDto: Codable {
    let optionID: String?
    let id: Int?
    let label: String?
    let attributeCode: String?
    
    enum CodingKeys: String, CodingKey {
        case optionID = "option_id"
        case id, label
        case attributeCode = "attribute_code"
    }
}
