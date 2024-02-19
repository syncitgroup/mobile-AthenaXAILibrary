//
//  CollectionPriceDto.swift
//  AthenaSearch
//
//  Created by Ana Stojkovic on 26/7/23.
//

import Foundation

public struct CollectionPriceDto: Codable {
    public let lowestPriceWithFilters: Float?
    public let highestPriceWithFilters: Float?
    public let lowestPrice: Float?
    public let highestPrice: Float?
    
    enum CodingKeys: String, CodingKey {
        case lowestPriceWithFilters = "lowest_price_with_filters"
        case highestPriceWithFilters = "highest_price_with_filters"
        case lowestPrice = "lowest_price"
        case highestPrice = "highest_price"
    }
}
