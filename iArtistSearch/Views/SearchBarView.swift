//
//  SearchBarView.swift
//  iArtistSearch
//
//  Created by Federico on 11/04/2022.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    let action: () -> Void
    
    var body: some View {
        HStack(spacing: 20) {
            TextField("Search for something here", text: $searchText)
                .textFieldStyle(.roundedBorder)
                .disableAutocorrection(true)
                .onSubmit {
                    action()
                }
            Button() {
                action()
            } label: {
                Label("", systemImage: "magnifyingglass")
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant("Linken Park")) {
            print("hello")
        }
    }
}
