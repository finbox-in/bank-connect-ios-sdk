//
//  FinBoxPayload.swift
//  BankConnect
//
//  Created by Srikar on 19/11/23.
//

import Foundation

/// Result Payload from BankConnect Journey
public struct FinBoxPayload: Codable {
    
    /// Message from Journey
    public let message: String?
    
    /// The unique user id passed to the SDK
    public let linkId: String?
    
    /// FinBox's unique id for the user
    public let entityId: String?
    
    /// Error Type
    public let errorType: String?
    
    /// Session Id
    public let sessionId: String?
    
    /// Coding keys to map between property names and JSON keys.
    ///
    /// Used to handle any naming discrepancies between Swift and JSON.
    enum CodingKeys: String, CodingKey {
        case message
        case linkId
        case entityId
        case errorType = "error_type"
        case sessionId = "sessionId"
    }
}
