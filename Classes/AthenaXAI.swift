//
//  AthenaXAI.swift
//  AthenaXAI
//
//  Created by Nemanja Cvetkovic on 26.10.23..
//

import Foundation

public class AthenaXAI {
    // MARK: - Initialization
    
    lazy var apiClientService: AthenaAPIClientService = {
        let sessionManager = DefaultAthenaNetworkSessionManager(session: AthenaSharedURLSession.shared)
        let networkManager = DefaultAthenaNetworkManager(sessionManager: sessionManager)
        return DefaultAthenaAPIClientService(networkManager: networkManager)
    }()
    
    public init(baseUrl: String, accessToken: String, token: String) {
        AthenaConfiguration.shared.setupConfig(athenaWebsiteUrl: baseUrl, accessToken: accessToken, token: token)
    }
    
    // MARK: - First click
    
    public func firstClick(query: String, token: String, customerGroupId: String) async throws -> AthenaAutocompleteResponseDTO? {
        try await apiClientService.request(endpoint: APIEndpoints.firstClickSearch(query: query, token: token, inResultsArray: true, customerGroupId: customerGroupId))
    }
    
    // MARK: - Autocomplete
    
    public func autocomplete(query: String, token: String, customerGroupId: String) async throws -> AthenaAutocompleteResponseDTO? {
        let response = try await apiClientService.request(endpoint: APIEndpoints.autocompleteSearch(query: query, token: token, inResultsArray: true, customerGroupId: customerGroupId))
        return response
    }
    
    // MARK: - Full Search
    
    public func fullSearch(query: String, token: String, search: Int, customer: String, page: String, customerGroupId: String, filters: [String : String]) async throws -> AthenaProductsListResultDTO? {
        try await apiClientService.request(endpoint: APIEndpoints.fullSearch(token: token, query: query, search: search, customer: customer, page: page, customerGroupId: customerGroupId, filters: filters))
    }
    
    // MARK: - Visual search
    
    public func visualSearch(image: String, token: String, customer: String, page: String, customerGroupId: String, filters: [String : String]) async throws -> AthenaProductsListResultDTO? {
        try await apiClientService.request(endpoint: APIEndpoints.visualSearch(token: token, image: image, search: 0, customer: customer, page: page, customerGroupId: customerGroupId, filters: filters))
    }
    
    //MARK: Category Data
    
    public func categorySearch(category: String, token: String, level: String, page: String, customerGroupId: String, campaignId: String?, utmCampaing: String?, filters: [String : String]) async throws -> AthenaProductsListResultDTO? {
        try await apiClientService.request(endpoint: APIEndpoints.categorySearch(token: token, category: category, level: level, page: page, customerGroupId: customerGroupId, campaignId: campaignId, utmCampaing: utmCampaing, filters: filters))
    }
    
    //MARK: Attribute Options
    public func getAttributeOptionsByCode(token: String, code: String) async throws -> AthenaAttributeResponseDTO? {
        try await apiClientService.request(endpoint: APIEndpoints.getAttributeOptionsByCode(token: token, code: code))
    }
    
    //MARK: Analytics
    public func sendProductClickToAthenaAnalytics(token: String?, productId: String?, type: AthenaProductClickType?, searchKeywords: String?, customer: String?, userToken: String?, source: String?, channel: String?) async throws -> AthenaMessageResponseDTO {
        return try await apiClientService.request(endpoint: APIEndpoints.athenaAnalyticsProductClick(token: token, productId: productId, type: type, searchKeywords: searchKeywords, customer: customer, userToken: userToken, source: source, channel: channel))
    }
    
    public func sendAddToCartToAthenaAnalytics(oId: String, token: String?, userToken: String, source: String?, channel: String?) async throws -> AthenaMessageResponseDTO {
        return try await apiClientService.request(endpoint: APIEndpoints.athenaAnalyticsConversionCart(oId: oId, token: token, userToken: userToken, source: source, channel: channel))
    }
    
    public func sendOrderToAthenaAnalytics(athenaAnalyticOrderBody: AthenaAnalyticOrderBodyDTO) async throws -> AthenaMessageResponseDTO {
        return try await apiClientService.request(endpoint: APIEndpoints.athenaAnalyticsConversionOrder(athenaAnalyticOrderBody: athenaAnalyticOrderBody))
    }
}
