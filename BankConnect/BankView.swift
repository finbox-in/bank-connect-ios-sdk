//
//  Entry point for the Bank View
//
//

import SwiftUI

public struct BankView: View {
    
    public init() {
        
    }
    
    @ObservedObject var viewModel = SessionViewModel()
    
    public var body: some View {
        VStack {
            if (viewModel.sessionUrl != nil) {
                // Load the webpage
                FinBoxWebView(urlStr: viewModel.sessionUrl)
            } else {
                if #available(iOS 14, *) {
                    // Show progress
                    ProgressView()
                }
            }

        }.onAppear(perform: {
            viewModel.fetch()
        })
    }
}

struct BankView_Previews: PreviewProvider {
    static var previews: some View {
        let _ = FinBoxBankConnect.Builder()
            .linkId(id: UUID().uuidString)
            .apiKey(key: "I9G9Js79et7ykyLCnFp279XxsJH85Jpu3d5E2Log")
            .build();
        BankView()
    }
}
