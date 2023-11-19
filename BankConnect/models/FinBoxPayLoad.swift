//
//  FinBoxPayLoad.swift
//  BankConnect
//
//  Created by Srikar on 19/11/23.
//

import Foundation

struct FinBoxPayload {
    
    // Additional Message
    let message: String?
    
    // Link Id for the session
    let linkId: String?
    
    // Entity id for the successful session
    let entityId: String?
    
    // Error type
    let error_type: String?
    
}
