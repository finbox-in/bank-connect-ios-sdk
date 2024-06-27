//
//  SessionResponse.swift
//  BankConnect
//
//  Created by Srikar on 19/11/23.
//


import Foundation

/// Response object for session url
struct SessionResponse: Hashable, Codable {
    let redirectUrl: String
    let sessionId: String
    
    enum CodingKeys: String, CodingKey {
        case redirectUrl = "redirect_url"
        case sessionId = "session_id"
    }
}

