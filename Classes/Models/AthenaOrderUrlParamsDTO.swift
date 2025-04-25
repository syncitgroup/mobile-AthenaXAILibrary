//
//  AthenaOrderUrlParamsDTO.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 23.4.25..
//

import Foundation

public struct AthenaOrderUrlParamsDTO: Codable {
    public let q: String?
    public let productListLimit: String?
    
    private enum CodingKeys: String, CodingKey {
        case q
        case productListLimit = "product_list_limit"
    }
}
