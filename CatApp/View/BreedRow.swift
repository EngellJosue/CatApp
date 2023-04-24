//
//  BreedRow.swift
//  CatApp
//
//  Created by User-M02 on 4/23/23.
//

import SwiftUI

struct BreedRow: View {
    let breed: Breed
    
    var body: some View {
        HStack {
            if breed.image?.url != nil {
                AsyncImage(url: URL(string: breed.image!.url!)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipped()
                    }
                    else if let _ = phase.error {
                        Image("not-available")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipped()
                    }
                    else {
                        ProgressView()
                            .frame(width: 100, height: 100)
                    }
                }
            }
            else {
                Image("not-available")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipped()
            }
            
            VStack(alignment: .leading, spacing: 5) {
                           Text(breed.name)
                               .font(.headline)
                           Text(breed.temperament)
            }
        }
    }
}

struct BreedRow_Previews: PreviewProvider {
    static var previews: some View {
        BreedRow(breed: Breed.example1())
            .previewLayout(.sizeThatFits)
    }
}
