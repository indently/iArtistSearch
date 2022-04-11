//
//  Content-ViewModel.swift
//  iArtistSearch
//
//  Created by Federico on 11/04/2022.
//

import Foundation

extension ContentView {
    final class ViewModel: ObservableObject {
        @Published var searchText = "linken park"
        @Published var searchResults = [Search]()
        
        init() {
            fetchSearchResults()
        }
        
        
        func fetchSearchResults(limit: Int = 25) {
            // Formats the string the user entered
            let trimmedSearch = self.searchText.trimmingCharacters(in: .whitespacesAndNewlines)
            let locSearch = trimmedSearch.replacingOccurrences(of: " ", with: "+")
            
            // Prepares the URL for the request
            let url = "https://itunes.apple.com/search?term=\(locSearch)&entity=musicTrack&country=dk&limit=\(limit)"
            
            // Attempts to create an API request, otherwise returns a failure.
            Bundle.main.fetchData(url: url, model: ItunesResult.self) { data in
                DispatchQueue.main.async {
                    self.searchResults = data.results
                }
                //print(data)
                
            } failure: { error in
                print(error)
            }
        }
    }
}
