//
//  Request model for the session API
//
//

import Foundation


struct SessionRequest: Hashable, Codable {

    // Unique id for the session
    let link_id: String
    
    // Unique id for the client
    let api_key: String
    
    let redirect_url: String?
    
    let from_date: String?
    
    let to_date: String?
    
    let logo_url: String?
    
    let bank_name: String?
    
    let mode: String?
}
