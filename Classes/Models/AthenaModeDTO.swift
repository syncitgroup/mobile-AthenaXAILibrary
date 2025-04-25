//
//  AthenaModeDTO.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 23.4.25..
//

import Foundation

public enum AthenaModeType: String, Codable {
    case list
    case grid
}

public struct AthenaModeDTO: Codable {
    public let name: String?
    public let type: AthenaModeType?
    public let optionKey: String?
    public let optionValue: String?
    public let optionLabel: String?
    public let url: String?
    public let urlPath: String?
    public let urlParams: AthenaUrlParamsDTO?
    public let selected: Bool?
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case type = "type"
        case optionKey = "option_key"
        case optionValue = "option_value"
        case optionLabel = "option_label"
        case url = "url"
        case urlPath = "url_path"
        case urlParams = "url_params"
        case selected = "selected"
    }
}
