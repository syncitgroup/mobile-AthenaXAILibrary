//
//  AthenaUrlParamsDTO.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 23.4.25..
//

import Foundation

public struct AthenaUrlParamsDTO: Codable {
    public let q: String?
    public let productListMode: String?
    
    private enum CodingKeys: String, CodingKey {
        case q = "q"
        case productListMode = "product_list_mode"
    }
}
