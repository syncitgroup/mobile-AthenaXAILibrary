//
//  AthenaSearchOrderDTO.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 23.4.25..
//

import Foundation

public struct AthenaSearchOrderDTO: Codable {
    public let url: String?
    public let optionKey: String?
    public let optionValue: Int?
    public let optionLabel: String?
    public let selected: Bool?
    public let urlPath: String?
    public let urlParams: AthenaOrderUrlParamsDTO?
    
    private enum CodingKeys: String, CodingKey {
        case url = "url"
        case optionKey = "option_key"
        case optionValue = "option_value"
        case optionLabel = "option_label"
        case selected = "selected"
        case urlPath = "url_path"
        case urlParams = "url_params"
    }
}
