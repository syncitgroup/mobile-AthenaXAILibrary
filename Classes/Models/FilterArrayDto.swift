//
//  FilterArrayDto.swift
//  AthenaSearch
//
//  Created by Ana Stojkovic on 26/7/23.
//

import Foundation

public class FilterArrayDto: Codable, Equatable {
    public let optionValue: String?
    public let optionKey: String?
    public let optionLabel: String?
    public let count: Int?
    public var selected: Bool?
    public let url: String?
    public let urlPath: String?
    public let urlParams: [String: String]?
    public let typeId: String?
    public let haxCode: String?
    public let attributeId: Int?
    
    public static func ==(lhs: FilterArrayDto, rhs: FilterArrayDto) -> Bool {
        return lhs.optionKey == rhs.optionKey && lhs.optionValue == rhs.optionValue
    }
    
    public var isSelected: Bool {
        get {
            if let selected = self.selected {
                return selected
            }
            return false
        }
        set {
            selected = newValue
        }
    }
    
    public func getOriginalValue() -> String? {
        if optionValue != nil {
            return optionValue
        }
        return nil
    }
    
    public func getFilter() -> FilterMapValue? {
        if let link = self.urlPath {
            var linkValues = link.components(separatedBy: "=")
            if linkValues.count >= 2 {
                linkValues[0].removeFirst()
                return FilterMapValue(key: linkValues[0], value: linkValues[1])
            }
        }
        return nil
    }
    
    private enum CodingKeys: String, CodingKey {
        case optionValue = "option_value"
        case optionKey = "option_key"
        case optionLabel = "option_label"
        case count
        case selected
        case url
        case urlPath = "url_path"
        case urlParams = "url_params"
        case typeId = "type_id"
        case haxCode = "hax_code"
        case attributeId = "attribute_id"
    }
    
}

public class FilterMapValue {
    private let _key: String
    private let _value: String
    
    fileprivate init(key: String, value: String) {
        _key = key
        _value = value
    }
    
    public var key: String {
        get {
            return _key
        }
    }
    
    public var value: String {
        get {
            return _value
        }
    }
}


