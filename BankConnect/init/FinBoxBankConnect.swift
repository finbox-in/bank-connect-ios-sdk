//
//  Initialize FinBoxBankConnect with the basic details
//
//

import Foundation


public class FinBoxBankConnect {
    
    private init(key: String, id: String, start: String?, end: String?, name: String?) {
        
    }
    
    public class Builder {
        
        public init() {
            
        }
        
        private var key: String?
        private var id: String?
        private var start: String?
        private var end: String?
        private var name: String?
        
        public func apiKey(key: String) -> Builder {
            self.key = key
            return self
        }

        public func linkId(id: String) -> Builder {
            self.id = id
            return self
        }
        
        public func fromDate(start: String) -> Builder {
            self.start = start
            return self
        }
        
        public func toDate(end: String) -> Builder {
            self.end = end
            return self
        }
        
        public func bank(name: String) -> Builder {
            self.name = name
            return self
        }

        public func build() -> FinBoxBankConnect {
            guard let key = self.key else {
                fatalError("API Key cannot be null")
            }
            
            guard let id = self.id else {
                fatalError("Link Id cannot be null")
            }
            
            // TODO: Validate the date

            savePreferences(apiKey: key, linkId: id, fromDate: start, toDate: end, bankName: name)

            return FinBoxBankConnect(key: key, id: id, start: self.start, end: self.end, name: self.name)
        }

        // Save the preferences in the local machine
        private func savePreferences(apiKey: String, linkId: String, fromDate: String?, toDate: String?, bankName: String?) {
            // Create a instance of preferences
            let userPreference = UserPreference()

            // Save the details in preferences
            userPreference.apiKey = apiKey
            userPreference.linkId = linkId
            userPreference.fromDate = fromDate
            userPreference.toDate = toDate
            userPreference.bankName = bankName
        }
    }
}
