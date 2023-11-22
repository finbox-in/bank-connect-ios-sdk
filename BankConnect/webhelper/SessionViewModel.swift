//
//  SessionViewModel to fetch the session url
//
//

import Foundation

class SessionViewModel: ObservableObject {
    
    /// API url to get the session url
    let urlStr = "https://portal.finbox.in/bank-connect/v1/session/"
    
    @Published var sessionUrl: String?
    
    // Fetch the Session URL from the Session API
    func fetch() {
        // Get the request body
        let requestBody = self.getRequestBody()
        
        guard let sessionBody = requestBody else {
            debugPrint("Request body is null")
            return
        }
        
        let task = URLSession.shared.dataTask(with: Utils.postRequest(urlStr: urlStr, body: sessionBody)) { data, response, error in
            if let error = error {
                self.handleClientError(error: error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                self.handleServerError(response: response)
                return
            }
            
            guard let data = data else {
                self.handleClientError(error: "Failed to receive Redirect Url")
                return
            }
            
            do {
                // Convert the response to Session Url
                let sessionResponse: SessionResponse = try JSONDecoder().decode(SessionResponse.self, from: data)
                debugPrint("Session Response Url \(sessionResponse.redirect_url as String?)")
                
                DispatchQueue.main.async {
                    self.sessionUrl = sessionResponse.redirect_url
                }
            } catch {
                self.handleClientError(error: error)
            }
            
        }
        task.resume()
    }
    
    func getSessionRequest() -> SessionRequest? {
        // Get a reference to user defaults
        let userPref = UserPreference()
        
        guard let linkId = userPref.linkId else {
            return nil
        }
        
        guard let apiKey = userPref.apiKey else {
            return nil
        }
        
        // Create a session object
        return SessionRequest(link_id: linkId, api_key: apiKey, redirect_url: userPref.redirectUrl, from_date: userPref.fromDate, to_date: userPref.toDate, logo_url: userPref.logoUrl, bank_name: userPref.bankName, mode: userPref.mode)
    }
    
    func getRequestBody() -> Data? {
        // Create Session Request
        let sessionRequest = getSessionRequest()
        
        guard let sessionRequest = sessionRequest else {
            // Session request is null
            return nil
        }
        
        // Convert Session request to json
        let jsonEncoder = JSONEncoder()
        let requestBody = try! jsonEncoder.encode(sessionRequest)
        
        // Return the request body
        return requestBody
    }
    
    func handleClientError(error: Any) {
        print("Response Error \(error as Any)")
    }
    
    func handleServerError(response: URLResponse?) {
        debugPrint("Response Error \(response as URLResponse?)")
    }
    
}
