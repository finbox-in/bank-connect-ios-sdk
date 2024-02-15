//
//  WebEventResponse.swift
//  BankConnect
//
//  Created by Srikar on 19/11/23.
//

import Foundation

/// Object for Web Events received as callbacks from webpage
struct WebEventResponse: Codable {
    let status: String
    let message: String?
    let payload: WebEventPayload
}
