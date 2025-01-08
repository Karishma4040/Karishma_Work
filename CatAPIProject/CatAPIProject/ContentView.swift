//
//  ContentView.swift
//  CatAPIProject
//
//  Created by Karishma Patil on 16.10.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var breedFetcher = MovieFetcher()
    var body: some View {
      
        if breedFetcher.isLoading {
            LoadingView()
        }else if breedFetcher.errorMessage != nil  {
            ErrorView(breedFetcher: breedFetcher)
        }else {
            MovieListView(movies: breedFetcher.movies)
        }
      
          
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
