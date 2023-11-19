//
//  WebEventResponse.swift
//  BankConnect
//
//  Created by Srikar on 19/11/23.
//

import Foundation

struct WebEventResponse: Codable {
    
    // Status of the event response
    let status: String
    
    // Message of the event response
    let message: String?
    
    // Event Payload
    let payload: WebEventPayload
    
}
