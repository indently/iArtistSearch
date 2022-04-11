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
}

struct Search : Codable, Identifiable {
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
}


