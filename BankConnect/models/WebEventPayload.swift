//
//  WebEventPayload.swift
//  BankConnect
//
//  Created by Srikar on 19/11/23.
//

import Foundation

struct WebEventPayload: Codable {
    
    // Name of the event
    let event_name: String
    
    // Additional Message
    let message: String
    
    // Link Id for the session
    let linkId: String
    
    // Entity id for the successful session
    let entityId: String
    
}

