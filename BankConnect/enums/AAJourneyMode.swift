//
//  AAJourneyMode.swift
//  BankConnect
//
//  Created by Srikar on 24/06/24.
//

/// Account Aggregator Journey Mode
public enum AAJourneyMode: String {
    
    /// Fetch once and Recurring from second time
    case ONCE_WITH_RECURRING = "once_with_recurring"
    
    /// Only Recurring fetches
    case ONLY_ONCE = "only_once"
}
