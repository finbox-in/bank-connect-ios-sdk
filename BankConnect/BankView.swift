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
    
    /// ViewModel
    @ObservedObject var viewModel = SessionViewModel()
    
    /// Result Closure
    public let bankResult : ((FinBoxPayload) -> Void)
    
    /// A property wrapper dismiss that accesses the dismiss action from the environment.
    @Environment(\.dismiss) private var dismiss
    
    /// Instance of Status to hold callback sent status
    private static var status = Status()
    
    public init(bankResult: @escaping (FinBoxPayload) -> Void) {
        self.bankResult = bankResult
    }
    
    public var body: some View {
        if viewModel.sessionFetched {
            VStack {
                if viewModel.sessionResult?.error == nil {
                    if viewModel.sessionResult?.sessionURL != nil {
                        FinBoxWebView(urlStr: viewModel.sessionResult?.sessionURL, bankResult: bankResult)
                    } else {
                        handleError(error: "Invalid session url")
                    }
                } else {
                    handleError(error: viewModel.sessionResult?.error ?? "Unknown Error")
                }
            }.onAppear() {
                debugPrint("Session Fetched", viewModel.sessionFetched)
            }
        } else {
            VStack {
                ProgressView()
            }.onAppear() {
                debugPrint("Fetching Session")
                viewModel.fetchSession()
            }
        }
    }
    
    func handleError(error: String) -> some View {
        // Check if the callback has already been sent
        if !BankView.status.callbackSent {
            BankView.status.updateStatus()
            bankResult(FinBoxPayload(message: error, linkId: "", entityId: "", errorType: ""))
        }
        dismiss()
        return EmptyView()
    }
}

