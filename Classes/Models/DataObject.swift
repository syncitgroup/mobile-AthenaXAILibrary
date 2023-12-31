//
//  DataObject.swift
//  AthenaSearch
//
//  Created by Ana Stojkovic on 25/8/23.
//

import Foundation

public class DataObject: Codable {
    public var product: ProductAthenaItem?
    public var popular: PopularSearchAthenaItem?
    public var category: CategoryAthenaItem?
    public var sectionA: SectionAthenaItem?
    public var sectionB: SectionBAthenaItem?
    
    enum CodingKeys: String, CodingKey, Codable {
        case product
        case popular
        case category
        case sectionA = "section_a"
        case sectionB = "section_b"
    }
    
    public func getSections() -> [AthenaItem] {
        var sections = [AthenaItem]()
        if let popularSearchSection = popular,
           popular?.items?.count != 0 {
            sections.append(popularSearchSection)
        }
        if let categorySection = category,
           category?.items?.count != 0 {
            sections.append(categorySection)
        }
        if let sectionASection = sectionA,
            sectionA?.items?.count != 0 {
            sections.append(sectionASection)
        }
        if let sectionBSection = sectionB,
           sectionB?.items?.count != 0 {
            sections.append(sectionBSection)
        }
        return sections
    }
    
    public func getProducts() -> [SearchItem] {
        return product?.items ?? []
    }
}

