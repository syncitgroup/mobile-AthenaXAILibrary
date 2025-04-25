//
//  AthenaSorterDTO.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 23.4.25..
//

import Foundation

public struct AthenaSorterDTO: Codable {
    public let url: String?
    public let optionLabel: String?
    public let optionKey: String?
    public let optionValue: String?
    public let selected: Bool?
    public let urlPath: String?
    public let urlParams: AthenaSorterUrlParamsDTO?
    
    private enum CodingKeys: String, CodingKey {
        case url = "url"
        case optionLabel = "option_label"
        case optionKey = "option_key"
        case optionValue = "option_value"
        case selected = "selected"
        case urlPath = "url_path"
        case urlParams = "url_params"
    }
}
