//
// Coordinator that handles Url clicks
//

import WebKit

class WebViewCoordinator: NSObject, WKNavigationDelegate {
    var parent: FinBoxWebView
    
    init(_ parent: FinBoxWebView) {
        self.parent = parent
    }
    
    func getHost(url: URL) -> Bool {
        let host = if #available(iOS 16.0, *) {
            url.host()
        } else {
            url.host
        }
        return host?.contains("finbox.in") == false
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let url = navigationAction.request.url {
            if url.scheme == "mailto" || url.scheme == "tel" || getHost(url: url) {
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
