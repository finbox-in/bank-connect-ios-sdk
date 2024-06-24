//
//  BankConnect.swift
//  BankConnect
//
//  Created by Ashutosh Jena on 12/12/23.
//

import Foundation

/// BankConnect SDK Initializer
public class BankConnect {
    
    private init(key: String, id: String, start: String?, end: String?, name: String?, journeyMode: JourneyMode?, mode: Mode?,
                 mobileNumber: String?, aaJourneyMode: AAJourneyMode?, aaRecurringTenureMonthCount: Int?,
                 aaRecurringFrequencyUnit: AARecurringFrequencyUnit?, aaRecurringFrequencyValue: Int?) {
        
    }
    
    
    /// The `BankConnect.Builder` is responsible for constructing initialisation of the BankConnect SDK
    public class Builder {
        
        public init() {}
        
        private var key: String?
        private var id: String?
        private var startDate: String?
        private var endDate: String?
        private var bankName: String?
        private var journeyMode: JourneyMode?
        private var mode: Mode?
        private var mobileNumber: String?
        private var aaJourneyMode: AAJourneyMode?
        private var aaRecurringTenureMonthCount: Int?
        private var aaRecurringFrequencyUnit: AARecurringFrequencyUnit?
        private var aaRecurringFrequencyValue: Int?
        
        /// Set API Key
        /// - Parameter key: Client API Key
        /// - Returns - Instance of `BankConnect.Builder`
        public func apiKey(_ key: String) -> Builder {
            self.key = key
            return self
        }
        
        /// Set Link Id
        /// - Parameter id: Unique user id
        /// - Returns Instance of `BankConnect.Builder`
        public func linkId(_ id: String) -> Builder {
            self.id = id
            return self
        }
        
        /// Set Start Date
        /// - Parameter start: Start Date of the form dd/MM/yyyy
        /// - Returns Instance of `BankConnect.Builder`
        public func fromDate(_ start: String) -> Builder {
            self.startDate = start
            return self
        }
        
        /// Set End Date
        /// - Parameter end: End Date of the form dd/MM/yyyy
        /// - Returns Instance of `BankConnect.Builder`
        public func toDate(_ end: String) -> Builder {
            self.endDate = end
            return self
        }
        
        /// Set Bank Name
        /// - Parameter name: Short name of the Bank
        /// - Returns Instance of `BankConnect.Builder`
        public func bank(_ name: String) -> Builder {
            self.bankName = name
            return self
        }
        
        /// Set Journey Mode
        /// - Parameter mode: Mode of the user journey
        /// - Returns Instance of `BankConnect.Builder`
        public func journeyMode(_ mode: JourneyMode?) -> Builder {
            self.journeyMode = mode
            return self
        }
        
        /// Set Mode
        /// - Parameter mode: Mode of the user journey
        /// - Returns Instance of `BankConnect.Builder`
        public func mode(_ mode: Mode?) -> Builder {
            self.mode = mode
            return self
        }
        
        /// Set Mobile number
        /// - Parameter mobileNumber: Mobile number of the user
        /// - Returns Instance of `BankConnect.Builder`
        public func mobileNumber(_ mobileNumber: String?) -> Builder {
            self.mobileNumber = mobileNumber
            return self
        }
        
        /// Set Account Aggregator Journey Mode
        /// - Parameter aaJourneyMode: Account Aggregator journey mode of the user journey
        /// - Returns Instance of `BankConnect.Builder`
        public func aaJourneyMode(_ aaJourneyMode: AAJourneyMode?) -> Builder {
            self.aaJourneyMode = aaJourneyMode
            return self
        }
        
        /// Set Account Aggregator Recurring Tenure Month Count
        /// - Parameter aaRecurringTenureMonthCount: Account Aggregator recurring tenure month count
        /// - Returns Instance of `BankConnect.Builder`
        public func aaRecurringTenureMonthCount(_ aaRecurringTenureMonthCount: Int?) -> Builder {
            self.aaRecurringTenureMonthCount = aaRecurringTenureMonthCount
            return self
        }
        
        /// Set Account Aggregator Recurring Frequency
        /// - Parameter aaRecurringFrequencyUnit: Account Aggregator recurring frequency
        /// - Returns Instance of `BankConnect.Builder`
        public func aaRecurringFrequencyUnit(_ aaRecurringFrequencyUnit: AARecurringFrequencyUnit?) -> Builder {
            self.aaRecurringFrequencyUnit = aaRecurringFrequencyUnit
            return self
        }
        
        /// Set Account Aggregator Recurring Frequency Value
        /// - Parameter aaRecurringFrequencyValue: Account Aggregator recurring frequency value
        /// - Returns Instance of `BankConnect.Builder`
        public func aaRecurringFrequencyValue(_ aaRecurringFrequencyValue: Int?) -> Builder {
            self.aaRecurringFrequencyValue = aaRecurringFrequencyValue
            return self
        }
        
        /// Create an instance of Builder
        /// - Returns Instance of `BankConnect.Builder` with passed parameters
        public func build() -> BankConnect {
            guard let key = self.key else {
                fatalError("API Key cannot be null")
            }
            
            guard let id = self.id else {
                fatalError("Link Id cannot be null")
            }
            
            if (!validateDate(startDate)) {
                // Start date is not valid
                fatalError("Invalid fromDate. Expected format: dd/MM/yyyy.")
            }
            
            if (!validateDate(endDate)) {
                // End date is not valid
                fatalError("Invalid toDate. Expected format: dd/MM/yyyy.")
            }
            
            // AA recurring tenure month is not valid
            
            // AA recurring frequency value is not valid
            
            if (mobileNumber != nil && invalidMobileNumber(mobileNumber!)) {
                // Phone number length should be 10 digits
                fatalError("Phone number length must be 10 digits and should contain only numbers.")
            }
            
            savePreferences(apiKey: key, linkId: id, fromDate: self.startDate, toDate: self.endDate, bankName: self.bankName, journeyMode: self.journeyMode,
                            mode: self.mode, mobileNumber: self.mobileNumber, aaJourneyMode: self.aaJourneyMode, aaRecurringTenureMonthCount: self.aaRecurringTenureMonthCount,
                            aaRecurringFrequencyUnit: self.aaRecurringFrequencyUnit, aaRecurringFrequencyValue: self.aaRecurringFrequencyValue)
            
            return BankConnect(key: key, id: id, start: self.startDate, end: self.endDate, name: self.bankName, journeyMode: self.journeyMode,
                               mode: self.mode, mobileNumber: self.mobileNumber ,aaJourneyMode: self.aaJourneyMode, aaRecurringTenureMonthCount: self.aaRecurringTenureMonthCount,
                               aaRecurringFrequencyUnit: self.aaRecurringFrequencyUnit, aaRecurringFrequencyValue: self.aaRecurringFrequencyValue)
        }
        
        /// Saves user details in local storage
        private func savePreferences(apiKey: String, linkId: String, fromDate: String?, toDate: String?, bankName: String?, journeyMode: JourneyMode?,
                                     mode: Mode?, mobileNumber: String?, aaJourneyMode: AAJourneyMode?, aaRecurringTenureMonthCount: Int?,
                                     aaRecurringFrequencyUnit: AARecurringFrequencyUnit?, aaRecurringFrequencyValue: Int?) {
            // Create a instance of preferences
            let userPreference = UserPreference()
            
            // Save the details in preferences
            userPreference.apiKey = apiKey
            userPreference.linkId = linkId
            userPreference.fromDate = fromDate
            userPreference.toDate = toDate
            userPreference.bankName = bankName
            userPreference.journeyMode = journeyMode
            userPreference.mode = mode
            userPreference.mobileNumber = mobileNumber
            userPreference.aaJourneyMode = aaJourneyMode
            userPreference.aaRecurringTenureMonthCount = aaRecurringTenureMonthCount
            userPreference.aaRecurringFrequencyUnit = aaRecurringFrequencyUnit
            userPreference.aaRecurringFrequencyValue = aaRecurringFrequencyValue
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
        
        /// Checks if the mobile number is valid or not
        /// - Parameter mobile: Date String input to the builder
        /// - Returns `true` if number is not valid, `false` otherwise.
        private func invalidMobileNumber(_ mobile: String) -> Bool {
            let trimmedNumber = mobile.trimmingCharacters(in: .whitespacesAndNewlines)
            if (trimmedNumber != mobile) {
                // There are spaces in the mobile number
                return true
            }
            
            // Check if the mobile number has exactly 10 digits
            if (mobile.count != 10) {
                return true
            }
            
            // Check if the mobile number contains all the numbers
            let numberCharacterSet = CharacterSet.decimalDigits
            return !CharacterSet(charactersIn: mobile).isSubset(of: numberCharacterSet)
        }
    }
}
