//
//  CallbackSent.swift
//  BankConnect
//
//  Created by Ashutosh Jena on 16/02/24.
//

import Foundation

/// Struct to hold callback sent status
struct Status {
    
    /// Flag to hold status
    var callbackSent = false
    
    /// Function which updates the sent status
    mutating func updateStatus() {
        callbackSent = true
    }
}
