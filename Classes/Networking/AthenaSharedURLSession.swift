//
//  AthenaSharedURLSession.swift
//  Pods
//
//  Created by Nemanja Cvetkovic on 22.4.25..
//

import Foundation

final class AthenaSharedURLSession {
    static var shared: URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 300
        configuration.httpShouldSetCookies = true
        configuration.httpCookieAcceptPolicy = .always
        return URLSession(configuration: configuration)
    }
}
