//
//  Content-ViewModel.swift
//  iArtistSearch
//
//  Created by Federico on 11/04/2022.
//

import Foundation

extension ContentView {
    final class ViewModel: ObservableObject {
        @Published var searchText = "linken+park"
        @Published var searchResults = [Search]()
        
        init() {
            fetchSearchResults()
            
            print(ItunesResult.sampleResults.results[0].trackName)
        }
        
        
        func fetchSearchResults(limit: Int = 25) {
            let url = "https://itunes.apple.com/search?term=\(searchText)&entity=musicTrack&country=dk&limit=\(limit)"
            
            Bundle.main.fetchData(url: url, model: ItunesResult.self) { data in
                DispatchQueue.main.async {
                    self.searchResults = data.results
                }
            
                print(data)
                
            } failure: { error in
                print(error)
            }
        }
    }
}
