//
//  AthenaAnalyticOrderItemDTO.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 25.4.25..
//

import Foundation

public struct AthenaAnalyticOrderItemDTO: Codable {
    public let name: String?
    public let id: String?
    public let sku: String?
    public let type: String?
    public let qty: Int?
    public let priceInclTax: Float?
    public let priceWithQtyInclTax: Float?
    public let price: Float?
    public let rowTotal: Float?
    
    public init(name: String?, id: String?, sku: String?, type: String?, qty: Int?, priceInclTax: Float?, priceWithQtyInclTax: Float?, price: Float?, rowTotal: Float?) {
        self.name = name
        self.id = id
        self.sku = sku
        self.type = type
        self.qty = qty
        self.priceInclTax = priceInclTax
        self.priceWithQtyInclTax = priceWithQtyInclTax
        self.price = price
        self.rowTotal = rowTotal
    }
    
    private enum CodingKeys: String, CodingKey {
        case name
        case id
        case sku
        case type
        case qty
        case priceInclTax = "price_incl_tax"
        case priceWithQtyInclTax = "price_with_qty_incl_tax"
        case price
        case rowTotal = "row_total"
    }
}
