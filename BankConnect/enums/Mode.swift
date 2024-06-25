//
//  Mode.swift
//  BankConnect
//
//  Created by Srikar on 24/06/24.
//

/// Specifies the mode in which the journey should be navigated to.
public enum Mode: String {
    /// Specifies that the SDK will launch in Account Aggregator Mode
    case AA = "aa"
    
    /// Specifies that the SDK will launch in Net-banking Mode
    case ONLINE = "online"
    
    /// Specifies that the SDK will launch in Manual PDF Upload Mode
    case PDF = "pdf"
}
