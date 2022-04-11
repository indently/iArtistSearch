//
//  ItemView.swift
//  iArtistSearch
//
//  Created by Federico on 11/04/2022.
//

import SwiftUI

struct ItemView: View {
    let search: Search
    
    var body: some View {
        Text("\(search.trackName)")
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(search: Search.sampleSearch)
    }
}
