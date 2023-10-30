//
//  SearchItem.swift
//  AthenaSearch
//
//  Created by Ana Stojkovic on 25/8/23.
//

import Foundation

public class SearchItem: Codable {
    public var id: RelaxedString?
    public var name: String?
    private var highlighted_name: String?
    public var link: String?
    public var sku: String?
    public var image: String?
    public var price: Price?
    public var category_names: [String]?
    
    public var idd: String? {
        get { id?.value }
        set { id = newValue.map(RelaxedString.init) }
    }
    
    public var highlightedName: String? {
        return highlighted_name
    }
    
    static public func getImageURL(fromUrl url: String) -> URL? {
        var image = url
        if image.contains("http://") {
            image = url.replacingOccurrences(of: "http://", with: "https://")
        }
        var imgURL = URL(string: image)
        return imgURL
    }
}
