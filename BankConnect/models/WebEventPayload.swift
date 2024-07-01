//
//  WebEventPayload.swift
//  BankConnect
//
//  Created by Srikar on 19/11/23.
//

import Foundation

/// Object in WebEvent
struct WebEventPayload: Codable {
    let eventName: String?
    let message: String?
    let linkId: String
    let entityId: String?
    let reason: String?
    let errorType: String?
    let sessionId: String?
    
    enum CodingKeys: String, CodingKey {
        case eventName = "event_name"
        case message
        case linkId
        case entityId
        case reason
        case errorType = "error_type"
        case sessionId = "sessionId"
    }
}

