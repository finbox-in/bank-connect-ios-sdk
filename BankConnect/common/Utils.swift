//
//  Class with common functions
//
//

import Foundation

struct Utils {
    
    // Pass a url to the function and get the GET URL Request
    static func getRequest(urlStr: String) -> URLRequest {
        return URLRequest(url: URL(string: urlStr)!)
    }
    
    // Pass a url to the function and get the POST URL Request
    static func postRequest(urlStr: String, body: Data) -> URLRequest? {
        guard let url = URL(string: urlStr) else {
            debugPrint("Convert to URL object is null")
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        
        // Add JSON Header
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Set the type as POST
        urlRequest.httpMethod = "POST"
        
        // Set the body
        urlRequest.httpBody = body
        
        // Return the response
        return urlRequest
    }
    
}
