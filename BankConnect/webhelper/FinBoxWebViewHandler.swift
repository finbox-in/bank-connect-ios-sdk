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
        let jsonData = try JSONSerialization.data(withJSONObject: message)
        let eventResponse = try JSONDecoder().decode(WebEventResponse.self, from: jsonData)
        
        debugPrint("Event Response Decode", eventResponse)
        debugPrint("Event Response Status", eventResponse.status)
        
        if (eventResponse.status == "error") {
            // Update the callback with error reason
            setCallbackPayload(message: eventResponse.payload.reason, eventResponse: eventResponse)
        } else {
            // Update the callback with payload message
            setCallbackPayload(message: eventResponse.payload.message, eventResponse: eventResponse)
        }
    }
    
    // Update the callback payload
    func setCallbackPayload(message: String?, eventResponse: WebEventResponse?) {
        // Generate the callback payload
        let payload = FinBoxPayload(message: message, linkId: eventResponse?.payload.linkId, entityId: eventResponse?.payload.entityId, error_type: eventResponse?.payload.error_type)
        debugPrint("Callback Entity Id", payload.entityId ?? "Empty Entity Id")

        // Send callback to the View
        self.bankResult(payload)
    }
    
}

