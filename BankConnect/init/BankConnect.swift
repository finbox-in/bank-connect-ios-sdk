//
//  BankConnect.swift
//  BankConnect
//
//  Created by Ashutosh Jena on 12/12/23.
//

import Foundation

// BankConnect SDK Initializer
public class BankConnect {
    
    private init(key: String, id: String, start: String?, end: String?, name: String?, mode: JourneyMode) {
        
    }
    
    
    public class Builder {
        
        public init() {}
        
        private var key: String?
        private var id: String?
        private var startDate: String?
        private var endDate: String?
        private var bankName: String?
        private var journeyMode: JourneyMode = JourneyMode.NORMAL
        
        public func apiKey(key: String) -> Builder {
            self.key = key
            return self
        }

        public func linkId(id: String) -> Builder {
            self.id = id
            return self
        }
        
        public func fromDate(start: String) -> Builder {
            self.startDate = start
            return self
        }
        
        public func toDate(end: String) -> Builder {
            self.endDate = end
            return self
        }
        
        public func bank(name: String) -> Builder {
            self.bankName = name
            return self
        }
        
        public func journeyMode(mode: JourneyMode) -> Builder {
            self.journeyMode = mode
            return self
        }

        public func build() -> BankConnect {
            guard let key = self.key else {
                fatalError("API Key cannot be null")
            }
            
            guard let id = self.id else {
                fatalError("Link Id cannot be null")
            }
            
            if (!validateDate(startDate)) {
                fatalError("Invalid fromDate. Expected format: dd/MM/yyyy.")
            }
            
            if (!validateDate(endDate)) {
                fatalError("Invalid toDate. Expected format: dd/MM/yyyy.")
            }

            savePreferences(apiKey: key, linkId: id, fromDate: startDate, toDate: endDate, bankName: bankName, journeyMode: journeyMode)

            return BankConnect(key: key, id: id, start: self.startDate, end: self.endDate, name: self.bankName, mode: self.journeyMode)
        }

        /// Saves user details in local storage
        private func savePreferences(apiKey: String, linkId: String, fromDate: String?, toDate: String?, bankName: String?, journeyMode: JourneyMode) {
            // Create a instance of preferences
            let userPreference = UserPreference()

            // Save the details in preferences
            userPreference.apiKey = apiKey
            userPreference.linkId = linkId
            userPreference.fromDate = fromDate
            userPreference.toDate = toDate
            userPreference.bankName = bankName
            userPreference.journeyMode = journeyMode
        }
        
        /// Validates Date Strings passed to the builder and throws Fatal Errors
        /// - Parameter dateStr: Date String input to the builder
        /// - Returns `true` if date is valid, `false` otherwise.
        private func validateDate(_ dateStr: String?) -> Bool {
            guard let date = dateStr else {
                return false
            }
            
            return validateDateFormat(date)
        }
    }
}
