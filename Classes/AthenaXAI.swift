//
//  AthenaXAI.swift
//  AthenaXAI
//
//  Created by Nemanja Cvetkovic on 26.10.23..
//

import Foundation
import Alamofire

public class AthenaXAI {
    // MARK: - Properties
    
    private let imageProcessor = ImageProcessor()
    private(set) var athenaConstants: AthenaConstants!
    private var imageCache = NSCache<NSString, NSString>()
    
    // MARK: - Initialization
    
    public init(baseUrl: String? = nil, accessToken: String? = nil, token: String? = nil) {
        athenaConstants = AthenaConstants(baseUrl: baseUrl, accessToken: accessToken, token: token)
    }
    
    // MARK: - First click
    
    public func firstClick(customerGroupId: String, completion: @escaping (_ searchResult: SearchResult) -> Void, fail: @escaping (_ message: String) -> Void) {
        let url = athenaConstants.firstClick
        do {
            let params = try SearchBody(token: self.athenaConstants.token, q: "", customerId: customerGroupId).asDictionary()
            AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: self.getHeaders()).response { response in
                
                print(response)
                if let data = response.data {
                    let decoder = JSONDecoder()
                    do {
                        let searchResult = try decoder.decode(SearchResult.self, from: data)
                        completion(searchResult)
                        
                    } catch {
                        fail(error.localizedDescription)
                    }
                }
            }
        } catch {
            fail("jsn error when creating body")
        }
    }
    
    // MARK: - Autocomplete
    
    public func autocomplete(query: String, customerGroupId: String, completion: @escaping (_ searchResult: SearchResult) -> Void, fail: @escaping (_ message: String) -> Void) {
        let url = athenaConstants.autocomplete
        do {
            let params = try SearchBody(token: self.athenaConstants.token, q: query, customerId: customerGroupId).asDictionary()
            AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers:  self.getHeaders()).response { response in
                print(response)
                if let data = response.data {
                    let decoder = JSONDecoder()
                    do {
                        let searchResult = try decoder.decode(SearchResult.self, from: data)
                        print(searchResult)
                        completion(searchResult)
                    } catch {
                        print(error)
                        fail(error.localizedDescription)
                    }
                }
            }
        } catch {
            fail("json error when creating body")
        }
    }
    
    // MARK: - Visual search
    
    public func visualSearch(image: UIImage, customerGroupId: String, customerEmail: String, filters: [String: String]?, currentPage: Int?, completion:@escaping (_ searchResult: LandingSearchResultDto) -> Void, fail: @escaping (_ message: String) -> Void) {
        let base64String = self.convertToBase64(image)
        if let cachedImage = imageCache.object(forKey: base64String as NSString) as String? {
            callVisualSearchRoute(imageCache: cachedImage, customerGroupId: customerGroupId, customerEmail: customerEmail, filters: filters, currentPage: currentPage, completion: completion, fail: fail)
        } else {
//            imageProcessor.processImage(image) { processedImage in
//                if let processedImage = processedImage {
//                    let processedImageBase64 = self.convertToBase64(processedImage)
                    let processedImageBase64 = self.convertToBase64(image)
                    self.callVisualSearchRoute(imageCache: processedImageBase64, customerGroupId: customerGroupId, customerEmail: customerEmail, filters: filters, currentPage: currentPage, completion: { searchResult in
                        if let newImageCache = searchResult.data?.imageCache {
                            self.imageCache.setObject(newImageCache as NSString, forKey: base64String as NSString)
                        }
                        completion(searchResult)
                    }, fail: fail)
                    
//                } else {
//                    print("Image processing failed.")
//                }
//            }
        }
    }
    
    //MARK: Category Data
    
    public func categoryProducts(categoryId: String, level: Int, filters: [String:String]?, currentPage: Int, customerGroupId: Int, completion: @escaping (_ searchResult: LandingSearchResultDto) -> Void, fail: @escaping (_ message: String) -> Void) {
        do {
            let url = athenaConstants.categoryData
            let request = ProductsSearchRequest(token: self.athenaConstants.token, category: categoryId, level: "\(level)", customerGroupId: "\(customerGroupId)")
            request.page = "\(currentPage)"
            var params = try request.asDictionary()
            if let filters = filters {
                params.merge(filters){(_, new) in new}
            }
            AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: self.getHeaders()).response { response in
                print(response)
                if let data = response.data {
                    let decoder = JSONDecoder()
                    do {
                        let searchResult = try decoder.decode(LandingSearchResultDto.self, from: data)
                        completion(searchResult)
                    } catch {
                        fail(error.localizedDescription)
                    }
                } else {
                    fail(response.error?.localizedDescription ?? "Error")
                }
            }
        } catch {
            fail("json error when creating body")
        }
    }
    
    // MARK: - Search Autocomplete
    
    public func searchAutocomplete(query: String, customerGroupId: String, completion: @escaping (_ searchResult: LandingSearchResultDto) -> Void, fail: @escaping (_ message: String) -> Void) {
        let url = athenaConstants.searchAutocomplete
        do {
            let params = try SearchBody(token: self.athenaConstants.token, q: query, customerId: customerGroupId).asDictionary()
            AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers:  self.getHeaders()).response { response in
                print(response)
                if let data = response.data {
                    let decoder = JSONDecoder()
                    do {
                        let searchResult = try decoder.decode(LandingSearchResultDto.self, from: data)
                        completion(searchResult)
                    } catch {
                        print(error)
                        fail(error.localizedDescription)
                    }
                } else {
                    fail(response.error?.localizedDescription ?? "Error")
                }
            }
        } catch {
            fail("json error when creating body")
        }
    }
    
    // MARK: - Private methods
    
    private func callVisualSearchRoute(imageCache: String, customerGroupId: String, customerEmail: String, filters: [String: String]?, currentPage: Int?, completion: @escaping (_ searchResult: LandingSearchResultDto) -> Void, fail: @escaping (_ message: String) -> Void) {
        let url = athenaConstants.visualSimilaritySearch
        do {
            let imageSearchBody = ImageSearchBody(token: self.athenaConstants.token, image: imageCache, customer: customerEmail, customerGroupId: customerGroupId)
            if let page = currentPage {
                imageSearchBody.page = "\(page)"
            }
            var params = try imageSearchBody.asDictionary()
            if let filters = filters {
                params.merge(filters){(_, new) in new}
            }
            AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: self.getHeaders()).response { response in
                print(response)
                if let data = response.data {
                    let decoder = JSONDecoder()
                    do {
                        let searchResult = try decoder.decode(LandingSearchResultDto.self, from: data)
                        completion(searchResult)
                    } catch {
                        print(error)
                        fail(error.localizedDescription)
                    }
                } else {
                    fail(response.error?.localizedDescription ?? "Error")
                }
            }
        } catch {
            fail("json error when creating body")
        }
    }
    
    private func convertToBase64(_ image: UIImage) -> String {
        let base64String = image.jpegData(compressionQuality: 1)?.base64EncodedString() ?? ""
        return base64String
    }
    
    private func getHeaders() -> HTTPHeaders {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(athenaConstants.accessToken)",
            "Accept": "application/json",
            "Content-Type" : "application/json",
            "Client-Source":"Mobile App",
            "Device":"Mobile",
            "Platform": "iOS"
        ]
        return headers
    }
}
