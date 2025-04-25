//
//  AthenaSearchFilterDTO.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 23.4.25..
//

import Foundation

public struct AthenaSearchFilterDTO: Codable {
    public let title: String?
    public let type: String?
    public let filtersArray: [AthenaFilterArrayFieldDTO]?
    
    private enum CodingKeys: String, CodingKey {
        case title
        case type
        case filtersArray = "array"
    }
}
