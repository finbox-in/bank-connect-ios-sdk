//
//  FinBoxWebView.swift
//  BankConnect
//
//  Created by Ashutosh Jena on 12/12/23.
//

import Foundation
import SwiftUI
import WebKit

///  Webview and its configurations
struct FinBoxWebView: UIViewRepresentable {
    
    let urlStr: String?
    let bankResult : ((FinBoxPayload) -> Void)
    
    func makeUIView(context: Context) -> WKWebView  {
        let config = WKWebViewConfiguration()
        config.userContentController = WKUserContentController()
        
        // iOS-JS Communication Channel
        config.userContentController.add(FinBoxWebViewHandler(bankResult: self.bankResult), name: "BankConnectFlutter")
        
        let webView = WKWebView(frame: UIScreen.main.bounds, configuration: config)
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let sessionUrl = urlStr else {
            debugPrint("Session Url is empty")
            return
        }
        uiView.load(NetworkUtils.getRequest(urlStr: sessionUrl))
    }
    
    func makeCoordinator() -> WebViewCoordinator {
        return WebViewCoordinator(self)
    }
}

