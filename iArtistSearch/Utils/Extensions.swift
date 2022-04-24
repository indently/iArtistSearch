//
//  Extensions.swift
//  iArtistSearch
//
//  Created by Federico on 18/04/2022.
//

import Foundation
import Swift

//MARK: - Test Extension to sort Search items.
extension Array where Element == Search {
    func sortAlphabeticallyUp() -> [Search] {
        return self.sorted { $0.trackName.lowercased() < $1.trackName.lowercased() }
    }
    
    func sortAlphabeticallyDown() -> [Search] {
        return self.sorted { $0.trackName.lowercased() > $1.trackName.lowercased() }
    }
}

extension String {
    func formatZTime() -> String{
        let utcISODateFormatter = ISO8601DateFormatter()
        
        let dateString = self
        let utcDate = utcISODateFormatter.date(from: dateString)
        let formattedString = String(utcDate?.formatted(date: .abbreviated, time: .omitted) ?? "")
        
        return formattedString
    }
}
