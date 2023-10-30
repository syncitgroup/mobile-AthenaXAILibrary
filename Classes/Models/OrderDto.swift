//
//  OrderDto.swift
//  AthenaSearch
//
//  Created by Ana Stojkovic on 27/7/23.
//

import Foundation

public struct OrderDto: Codable {
    let optionValue: Int?
    let optionKey: String?
    let optionLabel: String?   
    let url: String?
    let urlPath: String?
    let urlParams: [String: String]?
    let selected: Bool?
    
    enum CodingKeys: String, CodingKey {
        case optionValue = "option_value"
        case optionKey = "option_key"
        case optionLabel = "option_label"
        case url
        case urlPath = "url_path"
        case urlParams = "url_params"
        case selected
    }
}
