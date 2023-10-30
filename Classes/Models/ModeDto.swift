//
//  ModeDto.swift
//  AthenaSearch
//
//  Created by Ana Stojkovic on 26/7/23.
//

import Foundation

public struct ModeDto: Codable {
    let name: String?
    let type: String?
    let optionKey: String?
    let optionValue: String?
    let optionLabel: String?
    let url: String?
    let urlPath: String?
    let urlParams: ModeURLParams?
    let selected: Bool?
    
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
    let q : String?
    let page : String?
    let productListMode: String?
    
    enum CodingKeys: String, CodingKey {
        case page, q
        case productListMode = "product_list_mode"
    }
}
