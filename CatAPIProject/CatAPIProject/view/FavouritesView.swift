//
//  FavouriteList.swift
//  CatAPIProject
//
//  Created by Patil, Karishma Vikas on 05/11/24.
//
import SwiftUI

// Step 1: Create a FavouritesView with a background
struct FavouritesView: View {
    @Binding var favourites: [Movie]
    
    var body: some View {
            NavigationView {
                List(favourites) { movie in
                    Text(movie.title)
                }
                .background( LinearGradient(gradient: Gradient(colors: [Color.white, Color.pink.opacity(0.3)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all))
               
                .navigationTitle("Favourites")
            }
            
        
    }
}

