//
//  ItemView.swift
//  iArtistSearch
//
//  Created by Federico on 11/04/2022.
//

import SwiftUI

struct ItemView: View {
    let search: Search
    let dimensions: Double = 100
    
    var body: some View {
        HStack {
            VStack {
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
            .cornerRadius(20)
                Text("\(formatDate(date: search.releaseDate))")
                    .font(.subheadline)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("\(search.trackName)")
                    .font(.title3)
                    .bold()
                Text("\(search.artistName)")
                    .font(.subheadline)
                
            }
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(search: Search.sampleSearch)
            .padding()
    }
}
