//
//  AmountsDto.swift
//  AthenaSearch
//
//  Created by Ana Stojkovic on 26/7/23.
//

import Foundation

public struct AmountsDto: Codable {
    public let currentPage : Int?
    public let lastPage: Int?   
    public let from: Int?
    public let to: Int?
    public let perPage: Int?
    public let nextPage: Int?
    public let prevPage: Int?
    public let total: Int?
    
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
