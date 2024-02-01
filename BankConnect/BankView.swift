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
            viewModel.fetchSession()
        })
    }
}

