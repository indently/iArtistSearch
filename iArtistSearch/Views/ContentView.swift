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
            ScrollView {
                SearchBarView(searchText: $vm.searchText) {
                    vm.fetchSearchResults()
                }
                
                LazyVStack {
                    ForEach(vm.searchResults) { result in
                        NavigationLink(destination: DescriptionView(search: result)) {
                            VStack(alignment: .leading) {
                                ItemView(search: result)
                                Divider()
                            }
                            .padding(.horizontal)
                        }
                        .buttonStyle(PlainButtonStyle()) 
                    }
                }
            }
            .navigationTitle("iTunes Search")
            .alert("\(vm.errorMessage)", isPresented: $vm.displayingError) {
                Button("Got it!") {
                    // Add code here to fix the issue.
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
