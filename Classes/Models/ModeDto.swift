//
//  ModeDto.swift
//  AthenaSearch
//
//  Created by Ana Stojkovic on 26/7/23.
//

import Foundation

public struct ModeDto: Codable {
    public let name: String?
    public let type: String?
    public let optionKey: String?
    public let optionValue: String?
    public let optionLabel: String?
    public let url: String?
    public let urlPath: String?
    public let urlParams: ModeURLParams?
    public let selected: Bool?
    
    enum CodingKeys: String, CodingKey {
        case name, type
        case optionKey = "option_key"
        case optionValue = "option_value"
        case optionLabel = "option_label"
        case url
        case urlPath = "url_path"
        case urlParams = "url_params"
        case selected
    }
}

public struct ModeURLParams: Codable {
    public let q : String?
    public let page : String?
    public let productListMode: String?
    
    enum CodingKeys: String, CodingKey {
        case page, q
        case productListMode = "product_list_mode"
    }
}
