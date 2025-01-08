//
//  ErrorView.swift
//  ErrorView
//
//  Created by Karishma Patil on 16.10.24.
//

import SwiftUI

struct MovieListView: View {
    let movies: MovieResponse
    @State private var favourites: [Movie] = []
    var body: some View {
        TabView{
            ZStack {
                NavigationView {
                    List {
                        ForEach(movies.results) { movie in
                            NavigationLink {
                                MovieDetailView(movie: movie,  favourites: $favourites)
                            } label: {
                                MovieRow(movie: movie)
                            }
                            
                        }
                    }
                    .listStyle(PlainListStyle())
                    .navigationTitle(Text("Find Your Favourite Movie"))
                    .navigationBarTitleDisplayMode(.inline)
                    .overlay(
                        CustomNavigationBarTitle(title: "Find Your Favourite Movie", fontSize: 80)
                            .frame(width: 0, height: 0)
                    )
                }
            }
            .tabItem {
                Label("Movies", systemImage: "film")
            }
            FavouritesView(favourites: $favourites)
                            .tabItem {
                                Label("Favourites", systemImage: "heart")
                            }
                .font(.headline)
            
            LoginView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                .font(.headline)
        }
        
    }
}


struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(movies: MovieFetcher.successState().movies)
    }
}
