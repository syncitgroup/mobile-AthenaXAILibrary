//
//  AthenaSearchItemDto.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 23.4.25..
//

import Foundation

public struct AthenaSearchItemDTO: Codable {
    public let id: RelaxedString?
    public let name: String?
    public let highlightedName: String?
    public let link: String?
    public let sku: String?
    public let image: String?
    public let price: AthenaPriceDTO?
    public let categoryNames: [String]?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case highlightedName = "highlighted_name"
        case link
        case sku
        case image
        case price
        case categoryNames = "category_names"
    }
}
