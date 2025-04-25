//
//  AthenaProductsDataDTO.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 23.4.25..
//

import Foundation

public struct AthenaProductsDataDTO: Codable {
    public let results: [AthenaProductDTO]?
    public let amounts: AthenaAmountDTO?
    public let activeFilters: [AthenaActiveFilterDTO]?
    public let filters: [AthenaSearchFilterDTO]?
    public let sorters: [AthenaSorterDTO]?
    public let orders: [AthenaSearchOrderDTO]?
//    public let pager: []?
    public let collectionPrice: AthenaCollectionPriceDTO?
//    public let visual_filter: [Filter]?
    
    private enum CodingKeys: String, CodingKey {
        case results = "results"
        case amounts = "amounts"
        case activeFilters = "active_filters"
        case filters = "filters"
        case sorters = "sorters"
        case orders = "orders"
        case collectionPrice = "collection_price"
    }
}
