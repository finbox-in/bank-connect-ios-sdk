//
//  UserPref.swift
//  BankConnect
//
//  Created by Ashutosh Jena on 12/12/23.
//

import Foundation
import Combine


/// UserDefaults Class for storing basic user details
class UserPreference {
    
    // Instance of user defaults
    private let userDefaults = UserDefaults.standard
    
    // API Key
    var apiKey: String? {
        get {
            return userDefaults.object(forKey: FINBOX_BANK_CONNECT_API_KEY) as? String ?? nil
        }
        set {
            userDefaults.set(newValue, forKey: FINBOX_BANK_CONNECT_API_KEY)
        }
    }
    
    // Link Id
    var linkId: String? {
        get {
            return userDefaults.object(forKey: FINBOX_BANK_CONNECT_LINK_ID) as? String ?? nil
        }
        set {
            userDefaults.set(newValue, forKey: FINBOX_BANK_CONNECT_LINK_ID)
        }
    }
    
    // From Date
    var fromDate: String? {
        get {
            return userDefaults.object(forKey: FINBOX_BANK_CONNECT_FROM_DATE) as? String ?? nil
        }
        set {
            userDefaults.set(newValue, forKey: FINBOX_BANK_CONNECT_FROM_DATE)
        }
    }
    
    // To Date
    var toDate: String? {
        get {
            return userDefaults.object(forKey: FINBOX_BANK_CONNECT_TO_DATE) as? String ?? nil
        }
        set {
            userDefaults.set(newValue, forKey: FINBOX_BANK_CONNECT_TO_DATE)
        }
    }
    
    // Bank Name
    var bankName: String? {
        get {
            return userDefaults.object(forKey: FINBOX_BANK_CONNECT_BANK_NAME) as? String ?? nil
        }
        set {
            userDefaults.set(newValue, forKey: FINBOX_BANK_CONNECT_BANK_NAME)
        }
    }
    
    // Redirect Url
    var redirectUrl: String? {
        get {
            return userDefaults.object(forKey: FINBOX_BANK_CONNECT_REDIRECT_URL) as? String ?? nil
        }
        set {
            userDefaults.set(newValue, forKey: FINBOX_BANK_CONNECT_REDIRECT_URL)
        }
    }
    
    // Logo Url
    var logoUrl: String? {
        get {
            return userDefaults.object(forKey: FINBOX_BANK_CONNECT_LOGO_URL) as? String ?? nil
        }
        set {
            userDefaults.set(newValue, forKey: FINBOX_BANK_CONNECT_LOGO_URL)
        }
    }
    
    // Journey Mode
    var journeyMode: JourneyMode? {
        get {
            guard let mode = userDefaults.object(forKey: FINBOX_BANK_CONNECT_JOURNEY_MODE) as? String ?? nil else {
                return nil
            }
            return JourneyMode(rawValue: mode)
        }
        set {
            userDefaults.set(newValue?.rawValue, forKey: FINBOX_BANK_CONNECT_JOURNEY_MODE)
        }
    }
    
    // Mode
    var mode: Mode? {
        get {
            guard let mode = userDefaults.object(forKey: FINBOX_BANK_CONNECT_MODE) as? String ?? nil else {
                return nil
            }
            return Mode(rawValue: mode)
        }
        set {
            userDefaults.set(newValue?.rawValue, forKey: FINBOX_BANK_CONNECT_MODE)
        }
    }
    
    // Mobile number
    var mobileNumber: String? {
        get {
            return userDefaults.object(forKey: FINBOX_BANK_CONNECT_MOBILE_NUMBER) as? String ?? nil
        }
        set {
            userDefaults.set(newValue, forKey: FINBOX_BANK_CONNECT_MOBILE_NUMBER)
        }
    }
    
    // AA Journey Mode
    var aaJourneyMode: AAJourneyMode? {
        get {
            guard let journeyMode = userDefaults.object(forKey: FINBOX_BANK_CONNECT_AA_JOURNEY_MODE) as? String ?? nil else {
                return nil
            }
            return AAJourneyMode(rawValue: journeyMode)
        }
        set {
            userDefaults.set(newValue?.rawValue, forKey: FINBOX_BANK_CONNECT_AA_JOURNEY_MODE)
        }
    }
    
    // AA Recurring Tenure Month
    var aaRecurringTenureMonthCount: Int? {
        get {
            return userDefaults.object(forKey: FINBOX_BANK_CONNECT_AA_RECURRING_TENURE_MONTH_COUNT) as? Int ?? nil
        }
        set {
            userDefaults.set(newValue, forKey: FINBOX_BANK_CONNECT_AA_RECURRING_TENURE_MONTH_COUNT)
        }
    }
    
    // AA Recurring Frequency Unit
    var aaRecurringFrequencyUnit: AARecurringFrequencyUnit? {
        get {
            guard let frequencyUnit = userDefaults.object(forKey: FINBOX_BANK_CONNECT_AA_RECURRING_FREQUENCY_UNIT) as? String ?? nil else {
                return nil
            }
            return AARecurringFrequencyUnit(rawValue: frequencyUnit)
        }
        set {
            userDefaults.set(newValue?.rawValue, forKey: FINBOX_BANK_CONNECT_AA_RECURRING_FREQUENCY_UNIT)
        }
    }
    
    
    // AA Recurring Frequency Value
    var aaRecurringFrequencyValue: Int? {
        get {
            return userDefaults.object(forKey: FINBOX_BANK_CONNECT_AA_RECURRING_FREQUENCY_VALUE) as? Int ?? nil
        }
        set {
            userDefaults.set(newValue, forKey: FINBOX_BANK_CONNECT_AA_RECURRING_FREQUENCY_VALUE)
        }
    }
    
    // Token
    var userToken: String? {
        get {
            return userDefaults.object(forKey: FINBOX_BANK_CONNECT_USER_TOKEN) as? String ?? nil
        }
        set {
            userDefaults.set(newValue, forKey: FINBOX_BANK_CONNECT_USER_TOKEN)
        }
    }
    
    var sessionId: String? {
        get {
            return userDefaults.object(forKey: FINBOX_BANK_CONNECT_SESSION_ID) as? String ?? nil
        }
        set {
            userDefaults.set(newValue, forKey: FINBOX_BANK_CONNECT_SESSION_ID)
        }
    }
}
