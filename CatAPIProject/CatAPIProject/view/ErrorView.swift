//
//  ErrorView.swift
//  ErrorView
//
//  Created by Karishma Patil on 16.10.24.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var breedFetcher: MovieFetcher
    var body: some View {
        VStack {
            
            Text("😿")
                .font(.system(size: 80))
            
            Text(breedFetcher.errorMessage ?? "")
            
            Button {
                breedFetcher.fetchAllMovies()
            } label: {
                Text("Try again")
            }

            
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(breedFetcher: MovieFetcher())
    }
}
