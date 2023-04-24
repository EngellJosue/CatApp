//
//  BreedsListView.swift
//  CatApp
//
//  Created by User-M02 on 4/23/23.
//

import SwiftUI

struct BreedsListView: View {
    @State private var searchText: String = ""
    
    let breeds: [Breed]
    
    private var breedsResult: [Breed] {
        searchText.isEmpty ? breeds : breeds.filter { $0.name.lowercased().contains(searchText.lowercased())}
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(breedsResult) { breed in
                    NavigationLink {
                        BreedDetail(breed: breed)
                    } label: {
                        BreedRow(breed: breed)
                    }
                }
            }
            .navigationTitle("Find your perfect cat")
            .searchable(text: $searchText)
        }
    }
}

struct BreedsListView_Previews: PreviewProvider {
    static var previews: some View {
        BreedsListView(breeds: [Breed]())
    }
}
