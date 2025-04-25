//
//  AthenaPriceDTO.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 23.4.25..
//

import Foundation

public struct AthenaPriceDTO: Codable {
    public let regularPrice: Float?
    public let regularPriceWithCurrency: String?
    public let specialPrice: Float?
    public let specialPriceWithCurrency: String?
    public let loyaltyPrice: Float?
    public let loyaltyPriceWithCurrency: String?
    public let bestMonthPrice: Float?
    public let bestMonthPriceWithCurrency: String?
    public let discountPercentage: Int?
    
    private enum CodingKeys: String, CodingKey {
        case regularPrice = "regular_price"
        case regularPriceWithCurrency = "regular_price_with_currency"
        case specialPrice = "special_price"
        case specialPriceWithCurrency = "special_price_with_currency"
        case loyaltyPrice = "loyalty_price"
        case loyaltyPriceWithCurrency = "loyalty_price_with_currency"
        case bestMonthPrice = "best_month_price"
        case bestMonthPriceWithCurrency = "best_month_price_with_currency"
        case discountPercentage = "discount_percentage"
    }
}
