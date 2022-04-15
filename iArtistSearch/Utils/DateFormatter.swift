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
    
    let dateString = date
    let utcDate = utcISODateFormatter.date(from: dateString)
    let formattedString = String(utcDate?.formatted(date: .abbreviated, time: .omitted) ?? "")
    
    return formattedString
}
