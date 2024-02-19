//
//  LandingProductDto.swift
//  AthenaSearch
//
//  Created by Ana Stojkovic on 26/7/23.
//

import Foundation

public struct LandingProductDto: Codable {
    public let id: Int?
    public let name: String?
    public let link: String?
    public let productTypeID: String?
    public let description: String?
    public let shortDescription: String?
    public let availability: Int?
    public let createdAt: String?
    public let updatedAt: String?
    public let sku: String?
    public let price: PriceDto?
    public let image: String?
    public let categoryNames: [String]?
    public let metaTitle: String?
    public let fullImagePath: String?
//    public let hoverImage: String?
    public let metaDescription: String?
    public let brand: BrandDto?
    public let galleryImages: [String]?
    public let configurableOptions: [SearchConfigurableOptionDto]?
    public let childProducts: [SearchChildProductDto]?
    public let attributes: [AttributeDto]?
    public let productCombinations: [ProductCombinationDto]?
    public let views: Int?
    public let type: String?
    public let category_ids: [Int]?
    
    public func getId() -> String? {
        if let id = id {
            return "\(id)"
        }
        return nil
    }
    
    enum CodingKeys: String, CodingKey {
        case shortDescription = "short_description"
        case link, description
        case createdAt = "created_at"
        case availability
        case categoryNames = "category_names"
        case updatedAt = "updated_at"
        case price, id, sku, brand, views, image
        case metaTitle = "meta_title"
        case fullImagePath = "full_image_path"
//        case hoverImage = "hover_image"
        case productTypeID = "product_type_id"
        case metaDescription = "meta_description"
        case name, attributes
        case galleryImages = "gallery_images"
        case type
        case category_ids
        case configurableOptions = "configurable_options"
        case productCombinations = "product_combinations"
        case childProducts = "child_products"
    }
    
}
