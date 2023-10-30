//
//  ActiveFilterDto.swift
//  AthenaSearch
//
//  Created by Ana Stojkovic on 26/7/23.
//

import Foundation

public struct ActiveFilterDto: Codable {
    public let name: String?
    public let label: String?
    public let type: String?
    public let id: String?
}
