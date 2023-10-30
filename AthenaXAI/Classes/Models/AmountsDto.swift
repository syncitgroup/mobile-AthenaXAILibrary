//
//  AmountsDto.swift
//  AthenaSearch
//
//  Created by Ana Stojkovic on 26/7/23.
//

import Foundation

public struct AmountsDto: Codable {
    let currentPage : Int?
    let lastPage: Int?   
    let from: Int?
    let to: Int?
    let perPage: Int?
    let nextPage: Int?
    let prevPage: Int?
    let total: Int?
    
    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case lastPage = "last_page"
        case from, to
        case perPage = "per_page"
        case nextPage = "next_page"
        case prevPage = "prev_page"
        case total
    }
}
