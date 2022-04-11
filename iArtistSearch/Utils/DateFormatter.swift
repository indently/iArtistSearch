//
//  DateFormatter.swift
//  iArtistSearch
//
//  Created by Federico on 11/04/2022.
//

import Foundation

// Formats dates from ZULU time
func formatDate(date: String) -> String {
    let utcISODateFormatter = ISO8601DateFormatter()
    // Parsing a string timestamp representing a date
    let dateString = date
    let utcDate = utcISODateFormatter.date(from: dateString)
    
    return String(utcDate?.formatted(date: .abbreviated, time: .omitted) ?? "")
}
