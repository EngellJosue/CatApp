//
//  ErrorView.swift
//  CatApp
//
//  Created by User-M02 on 4/23/23.
//

import SwiftUI

struct ErrorView: View {
    let errorMessage: String
    
    var body: some View {
        VStack {
            Image("error")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
            Text(errorMessage)
                .font(.system(size: 25))
                .multilineTextAlignment(.center)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(errorMessage: "There was an error")
            .previewLayout(.sizeThatFits)
    }
}
