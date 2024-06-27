//
//  BankView.swift
//  BankConnect
//
//  Entry point for the SDK
//
//  Created by Ashutosh Jena on 12/12/23.
//

import Foundation
import SwiftUI

public struct BankView: View {
    
    // Result Function
    public let bankResult : ((FinBoxPayload) -> Void)
    
    @ObservedObject var viewModel = SessionViewModel()
    
    @State private var sessionId: String? = nil
    
    /// This property tracks if the viewmodel is fetching session
    /// State marks this as mutable
    @State var fetchStarted = false
    
    public init(bankResult: @escaping (FinBoxPayload) -> Void) {
        self.bankResult = bankResult
    }
    
    public var body: some View {
        VStack {
            if (fetchStarted) {
                // ViewModel is fetching the session
                if (viewModel.sessionResult?.error == nil) {
                    if (viewModel.sessionResult?.sessionURL != nil) {
                        // Load the webpage
                        FinBoxWebView(urlStr: viewModel.sessionResult?.sessionURL,
                                      bankResult: bankResult)
                    } else {
                        handleError(error: "Invalid Session Url")
                    }
                } else {
                    handleError(error: viewModel.sessionResult?.error ?? "Unknown Error")
                }
            } else {
                // First time the screen is loaded
                if #available(iOS 14, *) {
                    // Show progress
                    ProgressView()
                } else {
                    // Progress View is not available
                }
            }
        }.onAppear(perform: {
            // Fetch the session url
            viewModel.fetchSession{ result in
                // API fetching completed
                self.fetchStarted = result
                // Update session id
                sessionId = viewModel.sessionResult?.sessionId
                
                // Save session id to prefs
                UserPreference().sessionId = sessionId ?? ""
            }
        })
    }
    
    func handleError(error: String) -> some View {
        bankResult(FinBoxPayload(message: error, linkId: "", entityId: "", errorType: "", sessionId: sessionId))
        return Text("\(String(describing: error))")
    }
}
