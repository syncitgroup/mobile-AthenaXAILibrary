//
//  SearchChildProductDto.swift
//  AthenaSearch
//
//  Created by Ana Stojkovic on 27/7/23.
//

import Foundation

public struct SearchChildProductDto: Codable {
    let entityId: String?
    let sku: String?
    let image: String?
    let colorShade: String?
    let configurableOptions: [ChildProductConfigurableOptionDto]?
    let stockStatus: Bool?
    let hoverImage: String?
    
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
    let type: String?
    let value: String?
}
