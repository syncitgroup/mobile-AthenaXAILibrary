//
//  AthenaAnalyticOrderDTO.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 25.4.25..
//

import Foundation

public struct AthenaAnalyticOrderDTO: Codable {
    public let quoteId: Int?
    public let incrementId: String?
    public let storeId: Int?
    public let status: String?
    public let orderCurrencyCode: String?
    public let baseGrandTotal: Float?
    public let subtotalPrice: Float?
    public let taxPrice: Float?
    public let discountPrice: Float?
    public let shippingPrice: Float?
    public let items: [AthenaAnalyticOrderItemDTO]?
    
    public init(quoteId: Int?, incrementId: String?, storeId: Int?, status: String?, orderCurrencyCode: String?, baseGrandTotal: Float?, subtotalPrice: Float?, taxPrice: Float?, discountPrice: Float?, shippingPrice: Float?, items: [AthenaAnalyticOrderItemDTO]?) {
        self.quoteId = quoteId
        self.incrementId = incrementId
        self.storeId = storeId
        self.status = status
        self.orderCurrencyCode = orderCurrencyCode
        self.baseGrandTotal = baseGrandTotal
        self.subtotalPrice = subtotalPrice
        self.taxPrice = taxPrice
        self.discountPrice = discountPrice
        self.shippingPrice = shippingPrice
        self.items = items
    }
    
    private enum CodingKeys: String, CodingKey {
        case quoteId = "quote_id"
        case incrementId = "increment_id"
        case storeId = "store_id"
        case status = "status"
        case orderCurrencyCode = "order_currency_code"
        case baseGrandTotal = "base_grand_total"
        case subtotalPrice = "subtotal_price"
        case taxPrice = "tax_price"
        case discountPrice = "discount_price"
        case shippingPrice = "shipping_price"
        case items = "items"
    }
}
