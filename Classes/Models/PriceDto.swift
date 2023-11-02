//
//  PriceDto.swift
//  AthenaSearch
//
//  Created by Ana Stojkovic on 26/7/23.
//

import Foundation

public struct PriceDto: Codable {
    public let regularPrice: Float?
    public let regularPriceWithCurrency: String?
    public let specialPrice: Float?
    public let specialPriceWithCurrency: String?
    public let loyaltyPrice: Float?
    public let loyaltyPriceWithCurrency: String?
    public let discountPercentage: Int?
    public let bestMonthPrice: Float?
    public let bestMonthPriceWithCurrency: String?
    public let customFieldPrices: CustomFieldPricesDto?
    
    enum CodingKeys: String, CodingKey {
        case regularPrice = "regular_price"
        case regularPriceWithCurrency = "regular_price_with_currency"
        case specialPrice = "special_price"
        case specialPriceWithCurrency = "special_price_with_currency"
        case loyaltyPrice = "loyalty_price"
        case loyaltyPriceWithCurrency = "loyalty_price_with_currency"
        case discountPercentage = "discount_percentage"
        case customFieldPrices = "custom_field_prices"
        case bestMonthPrice = "best_month_price"
        case bestMonthPriceWithCurrency = "best_month_price_with_currency"
    }
}

public class CustomFieldPricesDto: Codable {
    public let regular_price: String?
    public let special_price: String?
    public let loyalty_price: String?
    public let best_month_price: String?
}
