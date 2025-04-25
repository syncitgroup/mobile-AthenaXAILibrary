//
//  AthenaAttributeOptionDTO.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 24.4.25..
//

import Foundation

public struct AthenaAttributeOptionDTO: Codable {
    public let id: Int?
    public let optionId: String?
    public let optionLabel: String?
    public let optionValue: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case optionId = "option_id"
        case optionLabel = "option_label"
        case optionValue = "option_value"
    }
}
