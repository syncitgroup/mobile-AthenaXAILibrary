//
//  PriceDto.swift
//  AthenaSearch
//
//  Created by Ana Stojkovic on 26/7/23.
//

import Foundation

public struct PriceDto: Codable {
    let regularPrice: Float?
    let regularPriceWithCurrency: String?
    let specialPrice: Float?
    let specialPriceWithCurrency: String?
    let loyaltyPrice: Float?
    let loyaltyPriceWithCurrency: String?
    let discountPercentage: Int?
    let bestMonthPrice: Float?
    let bestMonthPriceWithCurrency: String?
    let customFieldPrices: CustomFieldPricesDto?
    
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
    let regular_price: String?
    let special_price: String?
    let loyalty_price: String?
    let best_month_price: String?
}
