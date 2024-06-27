//
//  FinBoxWebViewHandler.swift
//  BankConnect
//
//  Created by Srikar on 17/11/23.
//

import Foundation
import WebKit


class FinBoxWebViewHandler: NSObject, WKScriptMessageHandler {
    
    // Result Function
    let bankResult : ((FinBoxPayload) -> Void)
    
    init(bankResult: @escaping (FinBoxPayload) -> Void) {
        self.bankResult = bankResult
    }

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        do {
            // Parse the message body received from webview
            try parseMessageBody(message: message.body)
        } catch {
            print("Json Decode Error")
        }
    }
    
    // Parse the message body from the webview event
    func parseMessageBody(message: Any) throws {
        // Serialize the message data
        let jsonData = try JSONSerialization.data(withJSONObject: message)
        // Convert the event response to struct
        let eventResponse = try JSONDecoder().decode(WebEventResponse.self, from: jsonData)
        
        if (eventResponse.status == FINBOX_BC_EXIT) {
            // Update the callback with payload message
            setCallbackPayload(message: eventResponse.payload.message, eventResponse: eventResponse)
        } else if (eventResponse.status == FINBOX_BC_SUCCESS) {
            // Update the callback with payload message
            setCallbackPayload(message: eventResponse.payload.message, eventResponse: eventResponse)
        } else if (eventResponse.status == FINBOX_BC_ERROR) {
            // Callback received for an error reason
            debugPrint("Error Reason", eventResponse.payload.reason ?? "Failed to receive Reason")
            debugPrint("Error Type", eventResponse.payload.errorType ?? "Failed to receive Error Type")
        } else if (eventResponse.status == FINBOX_BC_INFO) {
            // Callback received about generic events
            debugPrint("Info Name", eventResponse.payload.eventName ?? "Failed to receive Event Name")
            debugPrint("Info Message", eventResponse.payload.message ?? "Failed to receive Message")
        } else {
            debugPrint("Event Callback Status", eventResponse.status)
        }
    }
    
    // Update the callback payload
    func setCallbackPayload(message: String?, eventResponse: WebEventResponse?) {
        // Fetch session id from prefs
        let sessionId = UserPreference().sessionId
        
        // Generate the callback payload
        let payload = FinBoxPayload(message: message, linkId: eventResponse?.payload.linkId, entityId: eventResponse?.payload.entityId, errorType: eventResponse?.payload.errorType, sessionId: sessionId)

        // Send callback to the caller
        self.bankResult(payload)
    }
    
}

