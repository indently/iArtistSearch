//
//  ArtistModel.swift
//  iArtistSearch
//
//  Created by Federico on 11/04/2022.
//

import Foundation


struct ItunesResult : Codable {
    let resultCount: Int
    let results: [Search]
    
    static var sampleResults: ItunesResult = Bundle.main.decode(file: "Search.json")
}

struct Search : Codable, Identifiable, Equatable {
    let id = UUID()
    let artistName, collectionName, trackName, collectionCensoredName: String
    let artistViewUrl, collectionViewUrl, trackViewUrl: String
    let previewUrl: String
    let artworkUrl30, artworkUrl60, artworkUrl100: String
    let releaseDate: String
    let discCount, discNumber, trackCount, trackNumber: Int
    let trackTimeMillis: Int
    let country, currency, primaryGenreName: String
    let isStreamable: Bool
    
    static var sampleSearch: Search = ItunesResult.sampleResults.results[0]
}



