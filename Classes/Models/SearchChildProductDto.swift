//
//  SearchChildProductDto.swift
//  AthenaSearch
//
//  Created by Ana Stojkovic on 27/7/23.
//

import Foundation

public struct SearchChildProductDto: Codable {
    public let entityId: String?
    public let sku: String?
    public let image: String?
    public let colorShade: String?
    public let configurableOptions: [ChildProductConfigurableOptionDto]?
    public let stockStatus: Bool?
    public let hoverImage: String?
    
    enum CodingKeys: String, CodingKey {
        case entityId = "entity_id"
        case sku
        case image
        case colorShade = "color_shade"
        case configurableOptions = "configurable_options"
        case stockStatus = "stock_status"
        case hoverImage = "hover_image"
    }
}

public struct ChildProductConfigurableOptionDto: Codable {
    public let type: String?
    public let value: String?
}
