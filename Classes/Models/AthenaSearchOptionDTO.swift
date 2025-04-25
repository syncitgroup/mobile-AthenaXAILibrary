//
//  AthenaSearchOptionDTO.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 23.4.25..
//

import Foundation

public struct AthenaSearchOptionDTO: Codable {
    public let optionId: String?
    public let optionLabel: String?
    public let hashCode: String?
    public let optionType: String?
    public let seoValue: String?
    
    private enum CodingKeys: String, CodingKey {
        case optionId = "option_id"
        case optionLabel = "option_label"
        case hashCode = "hash_code"
        case optionType = "option_type"
        case seoValue = "seo_value"
    }
}
