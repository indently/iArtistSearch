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
        @Published var searchText: String = "linken park"
        @Published var apiState: LoadingState = .finished
        @Published var searchResults = [Search]()
        @Published var cachedResults = [Search]()
        
        @Published var displayingError = false
        @Published var errorMessage: String = ""
        @Published var sortResults = "aZ"
        
        private let animationDelay = 0.5
        private let sf = SearchFormatter()
        
        init() {
            fetchSearchResults()
        }
        
        // MARK: - Sorting Function
        func sortResultsAlphabetically() {
            withAnimation { self.cacheResults() }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + self.animationDelay) {
                withAnimation {
                    if self.sortResults == "aZ" {
                        self.sortResults = "Za"
                        self.searchResults = self.cachedResults.sortAlphabeticallyUp()
                    } else {
                        self.sortResults = "aZ"
                        self.searchResults = self.cachedResults.sortAlphabeticallyDown()
                    }
                }
            }
        }
        
        // MARK: - API Fetch Request
        func fetchSearchResults(limit: Int = 25) {
            // Make sure the user isn't searching nothing
            guard sf.isValidSearch(text: self.searchText) else {
                self.displayingError = true
                self.errorMessage = "Please insert a song / artist name."
                return }
            
            withAnimation { self.cacheResults() }
            
            // Formats the string the user entered
            let search = sf.formatSearchString(text: self.searchText)
            
            let url = "https://itunes.apple.com/search?term=\(search)&entity=musicTrack&country=dk&limit=\(limit)"
            
            self.apiState = .loading
        
            Task {
                do {
                    let results = try await fetchSearch(url: url, model: ItunesResult.self)
                    setResults(results: results.results)
                } catch {
                    handleError(error: error)
                }
            }
        }
        
        private func setResults(results: [Search]) {
            DispatchQueue.main.asyncAfter(deadline: .now() + self.animationDelay) {
                withAnimation {
                    self.searchResults = results
                    self.apiState = .finished
                }
                self.handleEmptyResults(results: self.searchResults)
            }
        }
        
        private func cacheResults() {
            cachedResults = searchResults
            searchResults = []
        }
        
        private func handleEmptyResults(results: [Search]) {
            if results.isEmpty {
                errorMessage = "There were no results..."
                displayingError = true
            }
        }
        
        private func handleError(error: Error) {
            errorMessage = error.localizedDescription
            displayingError = true
            apiState = .finished
        }
        
        func hideKeyboard() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}
