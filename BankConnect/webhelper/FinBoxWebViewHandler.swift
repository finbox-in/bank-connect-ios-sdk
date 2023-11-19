//
//  FinBoxWebViewHandler.swift
//  BankConnect
//
//  Created by Srikar on 17/11/23.
//

import Foundation
import WebKit


class FinBoxWebViewHandler: NSObject, WKScriptMessageHandler {
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        debugPrint("Event Repsonse", message.body)
        guard let bodyString = message.body as? String,
              let bodyData = bodyString.data(using: .utf8) else {
            debugPrint("Event Response is empty")
            return
        }

        let eventResponse = try? JSONDecoder().decode(WebEventResponse.self, from: bodyData)
        debugPrint("Entity Id", eventResponse?.payload.entityId ?? "Empty Entity Id")
        
        let payload = FinBoxPayload(message: eventResponse?.message, linkId: eventResponse?.payload.linkId, entityId: eventResponse?.payload.entityId, error_type: nil)
        debugPrint("Callback Entity Id", payload.entityId ?? "Empty Entity Id")

    }
}

