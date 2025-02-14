//
//  searchBarView.swift
//  MovieBookingApplication
//
//  Created by Patil, Karishma Vikas on 11/04/23.
//

import Foundation
import SwiftUI
struct ListView: View {
    @ObservedObject var viewModel = HomeScreenViewModel()
    var body: some View {
        ScrollView{
            VStack{
                let movies = viewModel.items
                ForEach(0..<movies.count ,id: \.self) { index in
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500" + movies[index].poster_path)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                    }
                placeholder: {
                    Color.gray.opacity(0.2)
                }
                    Text(movies[index].original_title)
                        .foregroundColor(.black)
                    HStack{
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                    .padding(.bottom,80)
                    .onTapGesture {
                        self.viewModel.shift = movies[index]
                        viewModel.shownext.toggle()
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetch()
        }
        .padding(.top, 30)
    }
}

