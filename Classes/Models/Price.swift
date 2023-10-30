//
//  Price.swift
//  AthenaSearch
//
//  Created by Ana Stojkovic on 25/8/23.
//

import Foundation

public class Price: Codable {
    private var regular_price: Float?
    private var regular_price_with_currency: String?
    private var special_price: Float?
    private var special_price_with_currency: String?
    private var loyalty_price: Float?
    private var loyalty_price_with_currency: String?
    private var best_month_price: Float?
    private var best_month_price_with_currency: String?
    private var discount_percentage: Int?
    private var custom_field_prices: CustomFieldPrices?
    
    public var regularPrice: Float? {
        return regular_price
    }
    public var regularPriceWithCurrency: String? {
        return regular_price_with_currency
    }
    public var specialPrice: Float? {
        return special_price
    }
    public var specialPriceWithCurrency: String? {
        return special_price_with_currency
    }
    public var loyaltyPrice: Float? {
        return loyalty_price
    }
    public var loyaltyPriceWithCurrency: String? {
        return loyalty_price_with_currency
    }
    public var bestMonthPrice: Float? {
        return best_month_price
    }
    public var bestMonthPriceWithCurrency: String? {
        return best_month_price_with_currency
    }
    public var discountPercentage: Int? {
        return discount_percentage
    }
    
    public var customFieldPrices: CustomFieldPrices? {
        return custom_field_prices
    }
}
