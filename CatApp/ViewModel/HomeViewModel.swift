//
//  HomeViewModel.swift
//  CatApp
//
//  Created by User-M02 on 4/23/23.
//

import Foundation
import SwiftUI

enum ViewModelState {
    case initial
    case loading
    case success
    case error(String)
}

final class HomeViewModel: ObservableObject {
    @Published var state: ViewModelState = .initial
    
    var catBreeds =  [Breed]()
    
    init() {
        fetchBreeds()
    }
    
    func fetchBreeds() {
        state = .loading
        let url = "https://api.thecatapi.com/v1/breeds?api_key=live_2qIr0QMr2Q4TOsp2a20qfT2dV53g4jGyCpx4v9rSrgOm6EyAPZvLX35dS17j5zP3"
        ApiManger.shared.fetch( [Breed].self ,url: url) { [unowned self] result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    self.state = .error(error.description)
                case .success(let breeds):
                    self.catBreeds = breeds
                    self.state = .success
                }
            }
        }
    }

}
