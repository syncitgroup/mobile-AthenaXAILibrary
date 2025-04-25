//
//  AthenaProductDTO.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 23.4.25..
//

import Foundation

public struct AthenaProductDTO: Codable {
    public let id: Int?
    public let name: String?
    public let link: String?
    public let productTypeId: String?
    public let description: String?
    public let shortDescription: String?
    public let availability: Int?
    public let sku: String?
    public let price: AthenaPriceDTO?
    public let image: String?
    public let categoryNames: [String]?
    
    public let configurableOptions: [AthenaSearchConfigurableOptionDTO]?
    public let childProducts: [AthenaSearchChildProductDTO]?
    
    public let views: Int?
    public let type: String?
    public let categoryIds: [Int]?
    public let salableQty: Int?
    public let productScore: Int?
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case link = "link"
        case productTypeId = "product_type_id"
        case description = "description"
        case shortDescription = "short_description"
        case availability = "availability"
        case sku = "sku"
        case price = "price"
        case image = "image"
        case categoryNames = "category_names"
        case configurableOptions = "configurable_options"
        case childProducts = "child_products"
        case views = "views"
        case type = "type"
        case categoryIds = "category_ids"
        case salableQty = "salable_qty"
        case productScore = "product_score"
    }
}
