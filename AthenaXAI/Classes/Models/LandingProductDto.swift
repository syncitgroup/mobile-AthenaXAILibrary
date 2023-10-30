//
//  LandingProductDto.swift
//  AthenaSearch
//
//  Created by Ana Stojkovic on 26/7/23.
//

import Foundation

public struct LandingProductDto: Codable {
    let id: Int?
    let name: String?
    let link: String?
    let productTypeID: String?
    let description: String?
    let shortDescription: String?
    let availability: Int?
    let createdAt: String?
    let updatedAt: String?
    let sku: String?
    let price: PriceDto?
    let image: String?
    let categoryNames: [String]?
    let metaTitle: String?
    let fullImagePath: String?
    let hoverImage: String?
    let metaDescription: String?
    let brand: BrandDto?
    let galleryImages: [String]?
    let configurableOptions: [SearchConfigurableOptionDto]?
    let childProducts: [SearchChildProductDto]?
    let attributes: [AttributeDto]?
    let productCombinations: [ProductCombinationDto]?
    let views: Int?
    let type: String?
    let category_ids: [Int]?
    
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
        case hoverImage = "hover_image"
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
