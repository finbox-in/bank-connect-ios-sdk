//
//  FinBoxPayLoad.swift
//  BankConnect
//
//  Created by Srikar on 19/11/23.
//

import Foundation

public struct FinBoxPayload: Codable {
    
    // Additional Message
    public let message: String?
    
    // Link Id for the session
    public let linkId: String?
    
    // Entity id for the successful session
    public let entityId: String?
    
    // Error type
    public let error_type: String?
    
}
