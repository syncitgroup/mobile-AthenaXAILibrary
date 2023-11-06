//
//  ProductsDto.swift
//  AthenaSearch
//
//  Created by Ana Stojkovic on 26/7/23.
//

import Foundation

public struct ProductsDto: Codable {
    public let results: [LandingProductDto]?
    public let amounts: AmountsDto?
    public let activeFilters: [ActiveFilterDto]?
    public let filters: [FilterDto]?
    public let sorters: [SorterDto]?
    let orders: [OrderDto]?
    let pager: [PagerDto]?
    let collectionPrice: CollectionPriceDto?
//  let visualFilter: VisualFilterDto?
    let visualFilter: [FilterDto]?
        
    enum CodingKeys: String, CodingKey {
        case results, amounts
        case activeFilters = "active_filters"
        case filters, pager, orders, sorters
        case collectionPrice = "collection_price"
        case visualFilter = "visual_filter"
    }
    
}
