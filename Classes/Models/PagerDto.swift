//
//  Pager.swift
//  AthenaSearch
//
//  Created by Ana Stojkovic on 27/7/23.
//

import Foundation

public struct PagerDto: Codable {
    public let optionValue: Int?
    public let optionKey: String?
    public let optionLabel: String?
    public let url: String?
    public let urlPath: String?
    public let urlParams: [String: String]?
    public let selected: Bool?
    public let type: String?
    
    enum CodingKeys: String, CodingKey {
        case optionValue = "option_value"
        case optionKey = "option_key"
        case optionLabel = "option_label"
        case url
        case urlPath = "url_path"
        case urlParams = "url_params"
        case selected
        case type
    }
}
