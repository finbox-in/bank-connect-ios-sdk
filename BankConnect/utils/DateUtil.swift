//
//  DateUtil.swift
//  BankConnect
//
//  Created by Ashutosh Jena on 12/12/23.
//

import Foundation

/// Validates the format of a date string.
/// - Parameter dateString: The input date string to be validated.
/// - Returns: `true` if the date string is in the format "dd/MM/yyyy", otherwise `false`.
func validateDateFormat(_ dateString: String) -> Bool {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyyy"
    
    if let _ = dateFormatter.date(from: dateString) {
        return true
    } else {
        return false
    }
}
