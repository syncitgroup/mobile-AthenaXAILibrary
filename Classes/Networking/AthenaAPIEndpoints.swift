//
//  AthenaAPIEndpoints.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 22.4.25..
//

import Foundation

public enum APIEndpoints {
    static func getAttributeOptionsByCode(token: String, code: String) -> AthenaAPIEndpoint<AthenaAttributeResponseDTO> {
        let queryParams: [String: Any] =  ["token" : token,
                                           "attribute_code" : code]
        return .init(path: "search/attributeOptionsByAttributeCode",
                     method: .get,
                     queryParameters: queryParams,
                     endpointType: .athenaAuthorized
        )
    }
    
    static func firstClickSearch(query: String, token: String, inResultsArray: Bool? = true, customerGroupId: String) -> AthenaAPIEndpoint<AthenaAutocompleteResponseDTO> {
        let parameters: [String : Any] = [
            "q" : query,
            "token" : token,
            "in_results_array" : inResultsArray,
            "customer_group_id" : customerGroupId
        ]
        
        return .init(path: "autocomplete/first-click",
                     method: .post,
                     bodyParameters: parameters,
                     endpointType: .athenaAuthorized
        )
    }
    
    static func autocompleteSearch(query: String, token: String, inResultsArray: Bool? = true, customerGroupId: String, isVoiceSearch: Bool) -> AthenaAPIEndpoint<AthenaAutocompleteResponseDTO> {
        let parameters: [String : Any] = [
            "q" : query,
            "token" : token,
            "in_results_array" : inResultsArray,
            "customer_group_id" : customerGroupId,
            "is_voice_search" : isVoiceSearch
        ]
        
        return .init(path: "autocomplete",
                     method: .post,
                     bodyParameters: parameters,
                     endpointType: .athenaAuthorized
        )
    }
    
    static func fullSearch(token: String, query: String, search: Int? = 0, customer: String, page: String, customerGroupId: String, isVoiceSearch: Bool, filters: [String: String]?) -> AthenaAPIEndpoint<AthenaProductsListResultDTO> {
        var parameters: [String : Any] = [
            "token" : token,
            "q" : query,
            "search" : search,
            "customer" : customer,
            "page" : page,
            "customer_group_id" : customerGroupId,
            "is_voice_search" : isVoiceSearch
        ]
        if let filters = filters {
            parameters.merge(filters, uniquingKeysWith: { _, new in  new })
        }
        
        return .init(path: "search/data",
                     method: .post,
                     bodyParameters: parameters,
                     endpointType: .athenaAuthorized
        )
    }
    
    static func visualSearch(token: String, image: String, search: Int? = 0, customer: String, page: String, customerGroupId: String, filters: [String: String]?) -> AthenaAPIEndpoint<AthenaProductsListResultDTO> {
        var parameters: [String : Any] = [
            "token" : token,
            "image" : image,
            "search" : search,
            "customer" : customer,
            "page" : page,
            "customer_group_id" : customerGroupId
        ]
        if let filters = filters {
            parameters.merge(filters, uniquingKeysWith: { _, new in  new })
        }
        
        return .init(path: "visual-similarity-search",
                     method: .post,
                     bodyParameters: parameters,
                     endpointType: .athenaAuthorized
        )
    }
    
    static func categorySearch(token: String, category: String, level: String?, page: String, customerGroupId: String, campaignId: String?, utmCampaing: String?, filters: [String: String]?) -> AthenaAPIEndpoint<AthenaProductsListResultDTO> {
        var parameters: [String : Any] = [
            "token" : token,
            "category" : category,
            "level" : level,
            "customer_group_id" : customerGroupId
        ]
        if page != "" {
            parameters["page"] = page
        }
        if campaignId != nil {
            parameters["campaign_id"] = campaignId
        }
        if utmCampaing != nil {
            parameters["utm_campaing]"] = utmCampaing
        }
        if let filters = filters {
            parameters.merge(filters, uniquingKeysWith: { _, new in  new })
        }
        
        return .init(path: "category/data",
                     method: .post,
                     bodyParameters: parameters,
                     endpointType: .athenaAuthorized
        )
    }
    
    //MARK: Athena analytics
    static func athenaAnalyticsProductClick(token: String?, productId: String?, type: AthenaProductClickType?, searchKeywords: String?, customer: String?, userToken: String?, source: String?, channel: String?) -> AthenaAPIEndpoint<AthenaMessageResponseDTO> {
        let parameters: [String : Any] = [
            "token" : token,
            "productId" : productId,
            "type" : type?.rawValue,
            "searchKeywords" : searchKeywords,
            "customer" : customer,
            "userToken" : userToken,
            "source" : source,
            "channel" : channel
        ]
        
        return .init(path: "product-click",
                     method: .post,
                     bodyParameters: parameters,
                     endpointType: .athenaAuthorized
        )
    }
    
    static func athenaAnalyticsConversionCart(oId: String, token: String?, userToken: String, source: String?, channel: String?) -> AthenaAPIEndpoint<AthenaMessageResponseDTO> {
        let parameters: [String : Any] = [
            "oId" : oId,
            "token" : token,
            "userToken" : userToken,
            "source" : source,
            "channel" : channel
        ]
        
        return .init(path: "conversion/cart",
                     method: .post,
                     bodyParameters: parameters,
                     endpointType: .athenaAuthorized
        )
    }
    
    static func athenaAnalyticsConversionOrder(athenaAnalyticOrderBody: AthenaAnalyticOrderBodyDTO) -> AthenaAPIEndpoint<AthenaMessageResponseDTO> {
        return .init(path: "conversion/order",
                     method: .post,
                     bodyParametersEncodable: athenaAnalyticOrderBody,
                     endpointType: .athenaAuthorized
        )
    }
}
