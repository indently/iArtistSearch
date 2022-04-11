//
//  ContentView.swift
//  iArtistSearch
//
//  Created by Federico on 11/04/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm =  ViewModel()
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
