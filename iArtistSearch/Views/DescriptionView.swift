//
//  DescriptionView.swift
//  iArtistSearch
//
//  Created by Federico on 11/04/2022.
//

import SwiftUI

struct DescriptionView: View {
    let search: Search
    let dimensions: Double = 120
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                AsyncImage(url: URL(string: search.artworkUrl100)!) { image in
                    if let image = image {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: dimensions, height: dimensions)
                    }
                } placeholder: {
                    ProgressView()
                        .frame(width: dimensions, height: dimensions)
                    
                }
                .background(.thinMaterial)
                .cornerRadius(10)
                .padding()
                Spacer()
            }
        
            
            List {
                Text("**Title**: \(search.trackName)")
                Text("**Artist**: \(search.artistName)")
                Text("**Release Date**: \(formatDate(date: search.releaseDate))")
                Text("**Length**: \(search.trackTimeMillis/1000/60) minutes")
                Text("**Genre**: \(search.primaryGenreName)")
            }
            .listStyle(.plain)
            
            
        }
        .padding()
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(search: Search.sampleSearch)
            
    }
}
