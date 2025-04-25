//
//  AthenaSearchConfigurableOptionDTO.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 23.4.25..
//

public struct AthenaSearchConfigurableOptionDTO: Codable {
    public let attributeId: Int?
    public let attributeCode: String?
    public let options: [AthenaSearchOptionDTO]?
    
    private enum CodingKeys: String, CodingKey {
        case attributeId = "attribute_id"
        case attributeCode = "attribute_code"
        case options = "options"
    }
}
