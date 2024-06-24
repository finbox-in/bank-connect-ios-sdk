//
//  AARecurringFrequencyUnit.swift
//  BankConnect
//
//  Created by Srikar on 24/06/24.
//

/// Account Aggregator Recurring Pull Frequency Unit
public enum AARecurringFrequencyUnit: String {
    
    /// Fetch AA hourly
    case HOUR = "hour"
    
    /// Fetch AA daily
    case DAY = "day"
    
    /// Fetch AA monthly
    case MONTH = "month"
    
    /// Fetch AA yearly
    case YEAR = "year"
}
