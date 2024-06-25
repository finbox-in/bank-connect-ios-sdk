//
//  SessionViewModel.swift
//  BankConnect
//
//  Created by Ashutosh Jena on 12/12/23.
//

import Foundation

/// A view model responsible for managing session-related data.
class SessionViewModel: ObservableObject {
    
    @Published var sessionResult: SessionResult?
    var sessionFetched = false
    
    func fetchSession(completion: @escaping (Bool) -> Void) {
        APIService.instance.fetchSession { result in
            debugPrint("Received Result in viewmodel")
            self.sessionFetched = true
            DispatchQueue.main.async {
                // Update sessionUrl on main thread when the network call completes
                self.sessionResult = result
                // Send the callback to the view
                self.sendCallback(completion: completion)
            }
        }
    }
    
    private func sendCallback(completion: @escaping (Bool) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now()) {
            completion(true)
        }
    }
    
}
