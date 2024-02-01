//
//  SessionViewModel.swift
//  BankConnect
//
//  Created by Ashutosh Jena on 12/12/23.
//

import Foundation

/// A view model responsible for managing session-related data.
class SessionViewModel: ObservableObject {
    
    @Published var sessionUrl: String?
    
    func fetchSession() {
        APIService.instance.fetchSession { result in
            debugPrint("Received Session in viewmodel")
            DispatchQueue.main.async {
                // Update sessionUrl on main thread when the network call completes
                self.sessionUrl = result
            }
        }
    }
    
}
