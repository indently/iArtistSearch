//
//  Content-ViewModel.swift
//  iArtistSearch
//
//  Created by Federico on 11/04/2022.
//

import Foundation
import SwiftUI

enum LoadingState {
    case finished, loading
}

extension ContentView {
    final class ViewModel: ObservableObject {
        @Published var searchText: String = "é"
        @Published var apiState: LoadingState = .finished
        @Published var searchResults = [Search]()
        @Published var cachedResults = [Search]()
        
        @Published var displayingError = false
        @Published var errorMessage: String = ""
        @Published var sortResults = "aA"
        
        private let animationDelay = 0.5
        private let sf = SearchFormatter()
        
        init() {
            fetchSearchResults()
        }
        
        // Sorts results alphabetically
        func sortResultsAlphabetically() {
            withAnimation {
                self.cacheResults()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + self.animationDelay) {
                    withAnimation {
                        if self.sortResults == "aA" {
                            self.sortResults = "Aa"
                            self.searchResults = self.cachedResults.sorted { $0.trackName.lowercased() < $1.trackName.lowercased() }
                        } else if self.sortResults == "Aa" {
                            self.sortResults = "aA"
                            self.searchResults = self.cachedResults.sorted { $0.trackName.lowercased() > $1.trackName.lowercased() }
                        }
                    }
                }
            }
        }
        
        func fetchSearchResults(limit: Int = 25) {
            // Make sure the user isn't searching nothing
            guard sf.isValidSearch(text: self.searchText) else {
                self.displayingError = true
                self.errorMessage = "Please insert a song / artist name."
                return }
            
            // Cache results
            withAnimation {
                self.cacheResults()
            }
            // Formats the string the user entered
            let search = sf.formatSearchString(text: self.searchText)
            
            // Prepares the URL for the request
            let url = "https://itunes.apple.com/search?term=\(search)&entity=musicTrack&country=dk&limit=\(limit)"
            
            self.apiState = .loading
            Bundle.main.fetchData(url: url, model: ItunesResult.self) { result in
                switch(result) {
                case .success(let data):
                    // Add a delay to create a smooth animation
                    DispatchQueue.main.asyncAfter(deadline: .now() + self.animationDelay) {
                        withAnimation {
                            self.searchResults = data.results
                            self.apiState = .finished
                        }
                        self.handleEmptyResults(results: self.searchResults)
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.handleError(error: error)
                    }
                }
            }
        }
        
        private func cacheResults() {
            self.cachedResults = self.searchResults
            self.searchResults = []
        }
        
        private func handleEmptyResults(results: [Search]) {
            if results.isEmpty {
                self.errorMessage = "There were no results..."
                self.displayingError = true
            }
        }
        
        private func handleError(error: Error) {
            self.errorMessage = error.localizedDescription
            self.displayingError = true
            self.apiState = .finished
        }
        
        func hideKeyboard() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}
