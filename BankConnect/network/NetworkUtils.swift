//
//  NetworkUtils.swift
//  BankConnect
//
//  Created by Ashutosh Jena on 12/12/23.
//

import Foundation

/// A utility struct for common network-related functions
struct NetworkUtils {
    
    /// Creates a URLRequest with the specified URL string.
    ///
    /// - Parameters:
    ///   - urlStr: The URL string to create the URLRequest.
    /// - Returns: A URLRequest object.
    static func getRequest(urlStr: String) -> URLRequest {
        // Force unwrap is used assuming that the input urlStr is a valid URL.
        // If there's a possibility of the URL being invalid, additional checks or error handling might be needed.
        return URLRequest(url: URL(string: urlStr)!)
    }
    
    /// Creates a POST URLRequest with the specified URL string and HTTP body data.
    ///
    /// - Parameters:
    ///   - urlStr: The URL string to create the URLRequest.
    ///   - body: The HTTP body data for the POST request.
    /// - Returns: A URLRequest object for a POST request or `nil` if the URL string is invalid or API Key is not found.
    static func postRequest(urlStr: String, body: Data) -> URLRequest? {
        guard let url = URL(string: urlStr) else {
            debugPrint("Convert to URL object is null")
            return nil
        }
        var urlRequest = URLRequest(url: url)
        
        let userPref = UserPreference()
        guard let apiKey = userPref.apiKey else {
            debugPrint("getSessionRequest: API key null")
            return nil
        }
        
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue(apiKey, forHTTPHeaderField: "x-api-key")
        
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = body
        
        return urlRequest
    }
    
}
