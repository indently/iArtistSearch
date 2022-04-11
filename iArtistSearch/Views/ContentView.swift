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
                HStack(spacing: 20) {
                    TextField("Search for something here", text: $vm.searchText)
                        .textFieldStyle(.roundedBorder)
                        .onTapGesture {
                            vm.searchText = ""
                        }
                    Button() {
                        vm.fetchSearchResults()
                    } label: {
                        Label("", systemImage: "magnifyingglass")
                            .foregroundColor(.blue)
                    }
                }
                .padding()
                
                LazyVStack {
                    ForEach(vm.searchResults) { result in
                        NavigationLink(destination: DescriptionView(search: result)) {
                            VStack(alignment: .leading) {
                                ItemView(search: result)
                                Divider()
                            }
                            .foregroundColor(.black)
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .alert("\(vm.errorMessage)", isPresented: $vm.displayingError) {
                Button("Got it!") {
                    // Add code here to fix the issue.
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
