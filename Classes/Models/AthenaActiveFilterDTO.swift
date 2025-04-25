//
//  AthenaActiveFilterDTO.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 23.4.25..
//

import Foundation

public struct AthenaActiveFilterDTO: Codable {
    public let name: String?
    public let label: String?
    public let type: String?
    public let id: String?
    public let url: String?
    public let urlValue: String?//Ovo je dodato zbog url rewrite-a
    public let urlPath: String?
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case label = "label"
        case type = "type"
        case id = "id"
        case url = "url"
        case urlValue = "url_value"
        case urlPath = "url_path"
    }
}
