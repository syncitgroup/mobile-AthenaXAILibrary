//
//  AthenaConstants.swift
//  Alamofire
//
//  Created by Nemanja Cvetkovic on 26.10.23..
//

import Foundation

class AthenaConstants {
    private static let baseUrlKey = "ATHENA_BASE_URL"
    private static let tokenKey = "ATHENA_TOKEN"
    private static let accessTokenKey = "ATHENA_ACCESS_TOKEN"
    
    private var _baseUrl: String
    private var _token: String
    private var _accessToken: String
    
    var baseUrl: String {
        get {
            return _baseUrl
        }
    }
    
    private var baseApiUrl: String {
        get {
            return baseUrl + "api/v2/"
        }
    }
    
    var visualSimilaritySearch: String {
        get {
            baseApiUrl + "visual-similarity-search"
        }
    }
    
    var autocomplete: String {
        get {
            baseApiUrl + "autocomplete"
        }
    }
    var firstClick: String {
        get {
            baseApiUrl + "autocomplete/first-click"
        }
    }
    
    var token: String {
        get {
            return _token
        }
    }
    
    var accessToken: String {
        get {
            return _accessToken
        }
    }
    
    public init(baseUrl: String?, accessToken: String?) {
        _baseUrl = baseUrl ?? "https://search-dashboard-stg.syncitgroup.com/"
        _accessToken = accessToken ?? "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMWVlM2U3NzI2NzdkZDU1ZjdjNDA4MGQxZWE5ZGVlNzg5ZDA1Y2VmMjk1MDI2NGE2MjQ1Y2EzNWU2ZDkzNTM5Yjg0OTQxMGQyYWZlMTJiYzgiLCJpYXQiOjE2ODk3NTI2NTAuMzk3MTM1LCJuYmYiOjE2ODk3NTI2NTAuMzk3MTM2LCJleHAiOjE3MjEzNzUwNTAuMzkxNzg1LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.A8BhUtltQkmQVO1KH72bJItTp8caKg4Th4NJ59pTM7kYwkkKjI-o7COrsMSvFv9IfqqxA_0sgEQTn9DLwoZR2lkTstYFl7NATzbwejVjb0XTMS6_k9lZZaPpFDv133iPeIbHx2I32r4_LASmC8EGDpFF0UN85hfISsefPMxXGWAySrwhHn0JePGWmxrPJ2v6AwXDIH-uSOxtaFMa93omgt8Lb6aLRXET9apjLq5rszVEnWv66VxmhFL7Q5HKpG8Jkg9ikmHSmRuRVAWR_ASH4novpqxuEeKGqq0_m5Qusnwl7sNYPEQGgiH5idmXlhfuxj92rL5Cdz7ID6cFVOBzCGdqF9Db9aBZDES-FPPyNXr4jV25KOAiexMta_x5nHCO9ZNW4Xua_qIw71BKsjCKnyuLFTKkNqVUE2rAPTBJU-xywT4YJj_1hJ8i12DxazI3rcSIBDQ-wIWTZIysWrM3eh_SrsqMavxSuOmmzubkccKKZZhaMsNPJI2TLSpZP2dLTArdX9xAc3hgLL1rJMJQQQJe4vYLMRxaRTgPNQCHc0UJkC-7WYPw8iVtuggl-StJD5qOWCQIvkXEWzeA5LmNdcKHRQX26wZCkYspJTIyJz44BVqoJQKb9xmb2TpQOZUHALGmeXBhe8w0d61Dy8JH1HBZFqHAYgpldSWk6qXDY0M"
        _token = "AsSDvZANGxkKmh4naANO"
    }
}
