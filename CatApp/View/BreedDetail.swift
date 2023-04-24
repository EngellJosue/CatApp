//
//  BreedDetail.swift
//  CatApp
//
//  Created by User-M02 on 4/23/23.
//

import SwiftUI

struct BreedDetail: View {
    let breed: Breed
    
    var body: some View {
        VStack {
            if breed.image?.url != nil {
                AsyncImage(url: URL(string: breed.image!.url!)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFit()
                            .frame(height: 300)
                    }
                    else if let _ = phase.error {
                        Image("not-available")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 300)
                    }
                    else {
                        ProgressView()
                            .frame(height: 300)
                    }
                }
            }
            else {
                Image("not-available")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
            }
            
            VStack(alignment: .leading, spacing: 15) {
                Text(breed.name)
                .font(.headline)
                Text(breed.temperament)
                .font(.footnote)
                Text(breed.breedExplaination)
                if breed.isHairless {
                    Text("hairless")
                }
                                   
                 HStack {
                    Text("Energy level")
                    Spacer()
                    ForEach(1..<6) { id in
                      Image(systemName: "star.fill")
                       .foregroundColor(id <= breed.energyLevel ? Color.accentColor : Color.gray )
                    }
                }
                                   
                Spacer()
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct BreedDetail_Previews: PreviewProvider {
    static var previews: some View {
        BreedDetail(breed: Breed.example1())
    }
}
