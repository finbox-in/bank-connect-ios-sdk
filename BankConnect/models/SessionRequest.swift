//
//  SessionRequest.swift
//  BankConnect
//
//  Created by Srikar on 19/11/23.
//

import Foundation

/// Request object for Session URL.
struct SessionRequest: Hashable, Codable {
    let linkId: String
    let apiKey: String
    let redirectURL: String?
    let fromDate: String?
    let toDate: String?
    let logoURL: String?
    let bankName: String?
    let journeyMode: String?
    let mode: String?
    let mobileNumber: String?
    let aaJourneyMode: String?
    let aaRecurringTenureMonthCount: Int?
    let aaRecurringFrequencyUnit: String?
    let aaRecurringFrequencyValue: Int?
    
    enum CodingKeys: String, CodingKey {
        case linkId = "link_id"
        case apiKey = "api_key"
        case redirectURL = "redirect_url"
        case fromDate = "from_date"
        case toDate = "to_date"
        case logoURL = "logo_url"
        case bankName = "bank_name"
        case journeyMode = "journey_mode"
        case mode = "mode"
        case mobileNumber = "mobile_number"
        case aaJourneyMode = "aa_journey_mode"
        case aaRecurringTenureMonthCount = "aa_recurring_tenure_month_count"
        case aaRecurringFrequencyUnit = "aa_recurring_frequency_unit"
        case aaRecurringFrequencyValue = "aa_recurring_frequency_value"
    }
}
