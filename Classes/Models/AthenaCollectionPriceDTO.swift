//
//  AthenaCollectionPriceDTO.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 23.4.25..
//

import Foundation

public struct AthenaCollectionPriceDTO: Codable {
    public let lowestPriceWithFilters: Float?
    public let highestPriceWithFilters: Float?
    public let lowestPrice: Float?
    public let highestPrice: Float?
    
    private enum CodingKeys: String, CodingKey {
        case lowestPriceWithFilters = "lowest_price_with_filters"
        case highestPriceWithFilters = "highest_price_with_filters"
        case lowestPrice = "lowest_price"
        case highestPrice = "highest_price"
    }
}
