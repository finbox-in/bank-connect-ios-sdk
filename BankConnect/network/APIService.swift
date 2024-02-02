//
//  APIService.swift
//  BankConnect
//
//  Created by Ashutosh Jena on 12/12/23.
//

import Foundation

/// Service struct that encapsulates API-related functionalities
/// -
struct APIService {
    
    /// Singleton instance of the `APIService`.
    static let instance = APIService()
    
    /// Fetches the session using network APIs and provides the session data to the completion closure.
    ///
    /// - Parameters:
    ///     - completion: A closure to be executed with the session data once it is fetched.
    ///       The closure takes a `String` parameter representing the session data.
    ///
    /// - Important:
    ///
    /// The completion closure is asynchronous and will be called once the session data is available.
    /// Make sure to handle the session data appropriately within the closure.
    func fetchSession(completion: @escaping (SessionResult) -> Void) {
        // Get the request body
        let requestBody = self.getRequestBody()
        
        guard let sessionBody = requestBody else {
            debugPrint("Request body is null")
            return
        }
        
        // Make the api call
        let requestParams = NetworkUtils.postRequest(urlStr: getSessionURL(), body: sessionBody)
        
        guard let requestParams = requestParams else {
            debugPrint("Request Params null")
            return
        }
        
        // Create a network request task
        let task = URLSession.shared.dataTask(with: requestParams) { data, response, error in
            if let error = error {
                //                self.handleClientError(completion: completion, error: error)
                self.handleError(completion: completion, error: error)
                return
            }
            
            // Check if there is a response and data
            guard let httpResponse = response as? HTTPURLResponse, let responseData = data else {
                debugPrint("Invalid response or no data")
                return
            }
            
            // Handle the HTTP response
            switch httpResponse.statusCode {
                
            case 200...299:
                debugPrint("Success: \(httpResponse.statusCode)")
                // Process the data here
                guard let data = data else {
                    self.handleClientError(completion: completion, error: "Failed to receive Redirect Url")
                    return
                }
                
                do {
                    // Convert the response to object
                    let sessionResponse: SessionResponse = try JSONDecoder().decode(SessionResponse.self, from: data)
                    
                    let result = SessionResult(error: nil, sessionURL: sessionResponse.redirectUrl)
                    // Send the callback
                    sendCallback(completion: completion, result: result)
                } catch {
                    self.handleClientError(completion: completion, error: error)
                }
                
            case 400...499:
                // Client error (status code 400 to 499)
                debugPrint("Client Error: \(httpResponse.statusCode)")
                // Handle client error
                self.handleClientError(completion: completion, error: error ?? "Some Client Error Occured")
                
            case 500...599:
                // Handle server error
                debugPrint("Server Error: \(httpResponse.statusCode)")
                self.handleServerError(completion: completion, error: error ?? "Some Server Error Occured")
                
            default:
                // Handle other status codes
                debugPrint("Unexpected status code: \(httpResponse.statusCode)")
            }
        }
        
        // Initiate the network request
        task.resume()
    }
    
    /// Constructs the URL for the session.
    /// - Returns: The URL for the session, formed by combining the `BASE_URL` and `END_POINT`
    private func getSessionURL() -> String {
        return FINBOX_BC_BASE_URL + FINBOX_BC_SESSION_END_POINT
    }
    
    /// Generates the request body data by encoding the request object to JSON.
    /// - Returns: Optional `Data` containing the JSON representation of the request object, or `nil` if request object is nil.
    func getRequestBody() -> Data? {
        let sessionRequest = getSessionRequest()
        
        guard let sessionRequest = sessionRequest else {
            // Session request is null
            return nil
        }
        
        // Convert Session request to json
        let jsonEncoder = JSONEncoder()
        let requestBody = try! jsonEncoder.encode(sessionRequest)
        
        return requestBody
    }
    
    /// Constructs the request object for fetching the session
    /// - Returns: Optional `SessionRequest` object, or `nil` if necessary keys are not found in prefs.
    func getSessionRequest() -> SessionRequest? {
        let userPref = UserPreference()
        
        guard let linkId = userPref.linkId else {
            return nil
        }
        
        guard let apiKey = userPref.apiKey else {
            return nil
        }
        
        // Create a session request object
        return SessionRequest(linkId: linkId, apiKey: apiKey, redirectURL: userPref.redirectUrl, fromDate: userPref.fromDate, toDate: userPref.toDate, logoURL: userPref.logoUrl, bankName: userPref.bankName, journeyMode: userPref.journeyMode?.rawValue)
    }
    
    /// Handles client errors
    func handleClientError(completion: @escaping (SessionResult) -> Void, error: Any) {
        debugPrint("Response Error Client: \(error as Any)")
        let result = SessionResult(error: String(describing: error), sessionURL: nil)
        sendCallback(completion: completion, result: result)
    }
    
    /// Handles server errors
    func handleServerError(completion: @escaping (SessionResult) -> Void, error: Any) {
        debugPrint("Response Error Server: \(String(describing: error))")
        let result = SessionResult(error: String(describing: error), sessionURL: nil)
        sendCallback(completion: completion, result: result)
    }
    
    /// Handles generic errors
    func handleError(completion: @escaping (SessionResult) -> Void, error: Any) {
        debugPrint("Response Error Generic: \(String(describing: error))")
        let result = SessionResult(error: String(describing: error), sessionURL: nil)
        sendCallback(completion: completion, result: result)
    }
    
    /// Sends an asynchronous callback after a (slight-possible) delay.
    /// - Parameters:
    ///   - completion: A closure to be executed when the asynchronous operation completes. It takes a `String` parameter.
    ///   - result: The result to be passed to the completion closure.
    func sendCallback(completion: @escaping (SessionResult) -> Void, result: SessionResult) {
        DispatchQueue.global().asyncAfter(deadline: .now()) {
            completion(result)
        }
    }
}

