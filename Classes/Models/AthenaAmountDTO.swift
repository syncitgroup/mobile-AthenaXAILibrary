//
//  AthenaAmountDTO.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 23.4.25..
//

import Foundation

public struct AthenaAmountDTO: Codable {
    public let currentPage: Int?
    public let lastPage: Int?
    public let from: Int?
    public let to: Int?
    public let perPage: Int?
//    var next_page: Page?
//    var prev_page: Page?
    public let total: Int?
    
    private enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case lastPage = "last_page"
        case from = "from"
        case to = "to"
        case perPage = "per_page"
        case total = "total"
    }
}
