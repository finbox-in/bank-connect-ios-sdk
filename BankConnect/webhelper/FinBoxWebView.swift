//
//  Handles loading of the Webview and its
//  configuration
//

import SwiftUI
import WebKit
import Foundation

struct FinBoxWebView: UIViewRepresentable {
    
    let urlStr: String?
    
    func makeUIView(context: Context) -> WKWebView  {
        let webView = WKWebView()
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let sessionUrl = urlStr else {
            debugPrint("Session Url is empty")
            return
        }
        uiView.load(Utils.getRequest(urlStr: sessionUrl))
    }
    
}

struct FinBoxWebView_Previews: PreviewProvider {
    static var previews: some View {
        FinBoxWebView(urlStr: "https://bankconnectclient.finbox.in/session_id=f6b166ff-2208-4250-b0e7-2d078d290e21")
    }
}
