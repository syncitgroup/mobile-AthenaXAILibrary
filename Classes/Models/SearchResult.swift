//
//  SearchResult.swift
//  AthenaSearch
//
//  Created by Ana Stojkovic on 25/8/23.
//

import Foundation

public class SearchResult: Codable {
    public public var data: ResultData?
}

public class ResultData: Codable {
    public public var results: DataObject?
    public public var banners: Banner?
}
