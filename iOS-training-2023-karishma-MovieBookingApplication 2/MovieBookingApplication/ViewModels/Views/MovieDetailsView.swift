//
//  MovieDetailsView.swift
//  MovieBookingApplication
//
//  Created by Patil, Karishma Vikas on 03/04/23.
//

import Foundation
import SwiftUI
struct MovieDetailsView: View {
    @ObservedObject var viewModel: MovieDetailsViewModel
    var body: some View {
        VStack{
            NavigationStack {
                HStack{
                    Image(systemName: "bookmark")
                        .imageScale(.large)
                        .foregroundColor(Color("Color"))
                    Spacer()
                    Image(systemName: "bookmark.circle")
                        .imageScale(.large)
                        .foregroundColor(.white)
                }
                Spacer()
                HStack{
                    if let movies = viewModel.movie {
                        VStack {
                            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500" + movies.poster_path)) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 250, height: 300)
                            }
                        placeholder: {
                            Color.gray.opacity(0.2)
                        }
                            Text(movies.original_title)
                                .foregroundColor(.white)
                                .font(.title)
                            
                            Text(movies.overview)
                                .foregroundColor(.white)
                                .font(.subheadline)
                        }
                    }
                }
                Spacer()
                HStack {
                    Button(action: {
                        viewModel.showThirdScreen = true
                    }){
                        Text("Buy Ticket")
                            .frame(width: 250, height: 20)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .background(Color(.blue))
                            .cornerRadius(15)
                    }
                }
                NavigationLink("",destination: SelectSeatView(totalSeats: 20), isActive: $viewModel.showThirdScreen)
            }
        }.background(Color("Color"))
    }
}















