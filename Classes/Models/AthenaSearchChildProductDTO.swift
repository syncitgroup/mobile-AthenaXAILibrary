//
//  AthenaSearchChildProductDTO.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 23.4.25..
//

import Foundation

public struct AthenaSearchChildProductDTO: Codable {
    public let entityId: String?
    public let sku: String?
    public let image: String?
    public let size: String?
    public let color: String?
    public let configurableOptions: [AthenaChildConfigurableOptionDTO]?
    
    private enum CodingKeys: String, CodingKey {
        case entityId = "entity_id"
        case sku = "sku"
        case image = "image"
        case size = "size"
        case color = "color"
        case configurableOptions = "configurable_options"
    }
}
