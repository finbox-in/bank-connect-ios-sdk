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
    
    // Mode
    var journeyMode: JourneyMode? {
        get {
            guard let mode = userDefaults.object(forKey: FINBOX_BANK_CONNECT_MODE) as? String ?? nil else {
                return nil
            }
            return JourneyMode(rawValue: mode)
        }
        set {
            userDefaults.set(newValue?.rawValue, forKey: FINBOX_BANK_CONNECT_MODE)
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
}
