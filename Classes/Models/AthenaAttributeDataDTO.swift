//
//  AthenaAttributeDataDTO.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 24.4.25..
//

import Foundation

public struct AthenaAttributeDataDTO: Codable {
    public let id: Int?
    public let attributeId: Int?
    public let attributeCode: String?
    public let defaultAttributeCode: String?
    public let options: [AthenaAttributeOptionDTO]?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case attributeId = "attribute_id"
        case attributeCode = "attribute_code"
        case defaultAttributeCode = "default_attribute_code"
        case options
    }
}
