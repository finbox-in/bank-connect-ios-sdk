//
// Coordinator that handles Url clicks
//

import WebKit

class WebViewCoordinator: NSObject, WKNavigationDelegate {
    var parent: FinBoxWebView
    
    init(_ parent: FinBoxWebView) {
        self.parent = parent
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let url = navigationAction.request.url {
            if url.scheme == "mailto" || url.scheme == "tel" || url.host()?.contains("finbox.in") == false {
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    decisionHandler(.cancel)
                    return
                }
            }
        }
        decisionHandler(.allow)
    }
}
