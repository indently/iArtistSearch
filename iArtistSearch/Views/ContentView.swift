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
        NavigationView {
            List {
                ForEach(vm.searchResults) { result in
                    VStack(alignment: .leading) {
                        
                        Text("\(result.trackName)")
                            .font(.system(size: 20, weight: .medium))
                        Text("\(result.artistName)")
                        
                        Text("\(result.artistViewUrl)")
                        
                        
                    }
                    .padding()
                    
                }
            }
            .navigationTitle("iTunes Search")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
