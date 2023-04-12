//
//  File stores the user preferences
//
//

import Foundation
import Combine



class UserPreference {

    struct Static {
        // Key contains the API Key
        static var FINBOX_BANK_CONNECT_API_KEY = "finbox-bank-connect-api-key"
        // Key contains the Link Id
        static var FINBOX_BANK_CONNECT_LINK_ID = "finbox-bank-connect-link-id"
        
        // Key contains the From date
        static var FINBOX_BANK_CONNECT_FROM_DATE = "finbox-bank-connect-from-date"
        
        // Key contains the To date
        static var FINBOX_BANK_CONNECT_TO_DATE = "finbox-bank-connect-to-date"
        
        // Key contains the Bank Name
        static var FINBOX_BANK_CONNECT_BANK_NAME = "finbox-bank-connect-bank-name"
        
        // Key contains the Redirect Url
        static var FINBOX_BANK_CONNECT_REDIRECT_URL = "finbox-bank-connect-redirect-url"
        
        // Key contains the Logo Url
        static var FINBOX_BANK_CONNECT_LOGO_URL = "finbox-bank-connect-logo-url"
        
        // Key contains the Mode
        static var FINBOX_BANK_CONNECT_MODE = "finbox-bank-connect-mode"
    }

    // Instance of user defaults
    private let userDefaults = UserDefaults.standard
    
    // API Key
    var apiKey: String? {
        get {
            return userDefaults.object(forKey: Static.FINBOX_BANK_CONNECT_API_KEY) as? String ?? nil
        }
        set {
            userDefaults.set(newValue, forKey: Static.FINBOX_BANK_CONNECT_API_KEY)
        }
    }

    // Link Id
    var linkId: String? {
        get {
            return userDefaults.object(forKey: Static.FINBOX_BANK_CONNECT_LINK_ID) as? String ?? nil
        }
        set {
            userDefaults.set(newValue, forKey: Static.FINBOX_BANK_CONNECT_LINK_ID)
        }
    }
    
    // From Date
    var fromDate: String? {
        get {
            return userDefaults.object(forKey: Static.FINBOX_BANK_CONNECT_FROM_DATE) as? String ?? nil
        }
        set {
            userDefaults.set(newValue, forKey: Static.FINBOX_BANK_CONNECT_FROM_DATE)
        }
    }
    
    // To Date
    var toDate: String? {
        get {
            return userDefaults.object(forKey: Static.FINBOX_BANK_CONNECT_TO_DATE) as? String ?? nil
        }
        set {
            userDefaults.set(newValue, forKey: Static.FINBOX_BANK_CONNECT_TO_DATE)
        }
    }
    
    // Bank Name
    var bankName: String? {
        get {
            return userDefaults.object(forKey: Static.FINBOX_BANK_CONNECT_BANK_NAME) as? String ?? nil
        }
        set {
            userDefaults.set(newValue, forKey: Static.FINBOX_BANK_CONNECT_BANK_NAME)
        }
    }
    
    // Redirect Url
    var redirectUrl: String? {
        get {
            return userDefaults.object(forKey: Static.FINBOX_BANK_CONNECT_REDIRECT_URL) as? String ?? nil
        }
        set {
            userDefaults.set(newValue, forKey: Static.FINBOX_BANK_CONNECT_REDIRECT_URL)
        }
    }
    
    // Redirect Url
    var logoUrl: String? {
        get {
            return userDefaults.object(forKey: Static.FINBOX_BANK_CONNECT_LOGO_URL) as? String ?? nil
        }
        set {
            userDefaults.set(newValue, forKey: Static.FINBOX_BANK_CONNECT_LOGO_URL)
        }
    }
    
    // Mode
    var mode: String? {
        get {
            return userDefaults.object(forKey: Static.FINBOX_BANK_CONNECT_MODE) as? String ?? nil
        }
        set {
            userDefaults.set(newValue, forKey: Static.FINBOX_BANK_CONNECT_MODE)
        }
    }
}
