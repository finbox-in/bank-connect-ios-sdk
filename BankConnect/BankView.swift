//
//  Entry point for the Bank View
//
//

import SwiftUI

public struct BankView: View {
    
    // Result Function
    public let bankResult : ((FinBoxPayload) -> Void)
    
    @ObservedObject var viewModel = SessionViewModel()
    
    public init(bankResult: @escaping (FinBoxPayload) -> Void) {
        self.bankResult = bankResult
    }
    
    public var body: some View {
        VStack {
            if (viewModel.sessionUrl != nil) {
                // Load the webpage
                FinBoxWebView(urlStr: viewModel.sessionUrl,
                              bankResult: bankResult)
            } else {
                if #available(iOS 14, *) {
                    // Show progress
                    ProgressView()
                } else {
                    // Progress View is not available
                }
            }
            
        }.onAppear(perform: {
            // Fetch the session url
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
        BankView() {
            payload in
            debugPrint("Result entity Id", payload.entityId ?? "Entity Id empty")
        }
    }
}
