//
//  SearchFormatter.swift
//  iArtistSearch
//
//  Created by Federico on 15/04/2022.
//

import Foundation

final class SearchFormatter {
    func isValidSearch(text: String) -> Bool {
        return text != ""
    }
    
    func formatSearchString(text: String) -> String {
        let trimmedSearch = text.trimmingCharacters(in: .whitespacesAndNewlines)
        let formattedSearch = trimmedSearch.replacingOccurrences(of: " ", with: "+")

        return formattedSearch
    }
}
