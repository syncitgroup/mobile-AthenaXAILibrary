//
//  CustomFieldPrices.swift
//  AthenaSearch
//
//  Created by Ana Stojkovic on 25/8/23.
//

import Foundation

public class CustomFieldPrices: Codable {
    private var regular_price: String?
    private var special_price: String?
    private var loyalty_price: String?
    private var best_month_price: String?
    
    public var regularPrice: String? {
        return regular_price
    }
    
    public var specialPrice: String? {
        return special_price
    }
    
    public var loyaltyPrice: String? {
        return loyalty_price
    }
    
    public var bestMonthPrice: String? {
        return best_month_price
    }
}
