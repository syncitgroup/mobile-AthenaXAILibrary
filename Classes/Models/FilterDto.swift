//
//  FilterDto.swift
//  Pods
//
//  Created by Ana Stojkovic on 26/7/23.
//

import Foundation

public class FilterDto: Codable {
    public var title: String? = nil
    public var type: String? = nil
    
    private var filtersSet = [FilterArrayDto]()
    public var array: [FilterArrayDto] {
        if filtersSet.count == 0 {
            self.filtersSet = self.removeDuplicateElements()
        }
        return filtersSet
    }
    private var filtersArray = [FilterArrayDto]()
    
    enum CodingKeys: String, CodingKey, Codable {
        case title
        case type
        case filtersArray = "array"
    }
    
    required public init(from decoder: Decoder) {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            
            if values.allKeys.contains(.title) {
                let o = try values.decode(String.self, forKey: .title)
                self.title = o
            } else {
                _ = decoder.codingPath
            }
            
            if values.allKeys.contains(.type) {
                self.type = try values.decode(String.self, forKey: .type)
            }
            
            if values.allKeys.contains(.filtersArray) {
                do {
                    let ar = try values.decode([FilterArrayDto].self, forKey: .filtersArray)
                    self.filtersArray = ar.filter({ (filter) -> Bool in
                        if (filter.getOriginalValue() != nil && filter.getOriginalValue() == "") || (filter.optionLabel != nil && filter.optionLabel == "") {//} || (filter.getFilterValue() != nil && filter.getFilterValue() == "") {
                            return false
                        }
                        return true
                    })
                } catch {
                    print(error)
                }
            }
            
        } catch {
            print(error)
        }
    }
    
    private func removeDuplicateElements() -> [FilterArrayDto] {
        var uniqueFilters = [FilterArrayDto]()
        for filter in self.filtersArray {
            if !uniqueFilters.contains(where: {
                if $0.getFilter() != nil && filter.getOriginalValue() != nil {
                    return $0.getOriginalValue() == filter.getOriginalValue()
                } else if $0.getOriginalValue() != nil && $0.getOriginalValue() != "" && filter.getOriginalValue() != nil && filter.getOriginalValue() != "" {
                    return $0.getOriginalValue() == filter.getOriginalValue()
                }
                return false
            }) {
                uniqueFilters.append(filter)
            }
        }
        return uniqueFilters
    }
}
