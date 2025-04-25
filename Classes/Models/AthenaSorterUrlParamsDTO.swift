//
//  AthenaSorterUrlParamsDTO.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 23.4.25..
//

import Foundation

public struct AthenaSorterUrlParamsDTO: Codable {
    public let q: String?
    public let productListOrder: String?
    
    private enum CodingKeys: String, CodingKey {
        case q = "q"
        case productListOrder = "product_list_order"
    }
}
