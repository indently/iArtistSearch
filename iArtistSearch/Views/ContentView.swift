//
//  ContentView.swift
//  iArtistSearch
//
//  Created by Federico on 11/04/2022..
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm =  ViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                if vm.apiState == .loading {
                    ProgressView()
                }
                
                ScrollView {
                    SearchBarView(searchText: $vm.searchText) {
                        vm.fetchSearchResults()
                        vm.hideKeyboard()
                    }
                    LazyVStack {
                        ForEach(vm.searchResults, id: \.trackViewUrl) { result in
                            NavigationLink(destination: DescriptionView(search: result)) {
                                VStack(alignment: .leading) {
                                    ItemView(search: result)
                                        .onAppear {
                                            print("Loaded: \(result.trackName)")
                                        }
                                    Divider()
                                }
                                .padding(.horizontal)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .animation(.spring(), value: vm.searchResults)
                            .transition(.scale)
                        }
                    }
                }
                .navigationTitle("iTunes Search")
                .alert("Error", isPresented: $vm.displayingError) {
                    Button("Got it!") {
                        // Add code here to fix the issue.
                    }
                } message: {
                    Text("\(vm.errorMessage)")
                }
                .toolbar {
                    ToolbarItem {
                        Button(vm.sortResults, action: vm.sortResultsAlphabetically)
                    }
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
