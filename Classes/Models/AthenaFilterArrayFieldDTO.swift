//
//  AthenaFilterArrayFieldDTO.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 23.4.25..
//

import Foundation

public struct AthenaFilterArrayFieldDTO: Codable {
    public let optionValue: String?
    public let optionId: String?
    public let optionKey: String?
    public let optionLabel: String?
    public let count: Int?
    public let selected: Bool?
    public let url: String?
    public let urlPath: String?
//  public let urlParams: [String: String]?
    public let typeId: String?
    public let haxCode: String?
    public let attributeId: Int?
    
    private enum CodingKeys: String, CodingKey {
        case optionValue = "option_value"
        case optionId = "option_id"
        case optionKey = "option_key"
        case optionLabel = "option_label"
        case count = "count"
        case selected = "selected"
        case url = "url"
        case urlPath = "url_path"
//        case urlParams = "url_params"
        case typeId = "type_id"
        case haxCode = "hax_code"
        case attributeId = "attribute_id"
    }
}
