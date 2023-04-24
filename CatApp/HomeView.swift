//
//  ContentView.swift
//  CatApp
//
//  Created by User-M02 on 4/22/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        switch viewModel.state {
        case .loading, .initial:
            ProgressView()
                .tint(.black)
                .scaleEffect(5)
        case .error(let error):
            ErrorView(errorMessage: error)
        case .success:
            BreedsListView(breeds: viewModel.catBreeds)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
