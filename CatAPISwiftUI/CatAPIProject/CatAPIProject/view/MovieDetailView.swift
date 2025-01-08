//
//  BreedDetailView.swift
//  BreedDetailView
//
 //  Created by Karishma Patil on 16.10.24.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    let imageSize: CGFloat = 300
    @Binding var favourites: [Movie]
    @State private var movieImage: UIImage? = nil
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.pink.opacity(0.3)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack {
                    if let movieImage = movieImage {
                        Image(uiImage: movieImage)
                            .resizable()
                            .frame(width: 400, height: 400)
                            .cornerRadius(8)
                    } else {
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 400, height: 40)
                            .cornerRadius(8)
                    }
                    
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Text(movie.title)
                                .font(.largeTitle)
                                .frame(alignment: .center)
                            Spacer()
                                       Button(action: {
                                           if favourites.contains(where: { $0.id == movie.id }) {
                                               favourites.removeAll { $0.id == movie.id }
                                           } else {
                                               favourites.append(movie)
                                           }
                                       }) {
                                           Image(systemName: favourites.contains(where: { $0.id == movie.id }) ? "heart.fill" : "heart")
                                               .foregroundColor(.red)
                                       }
                        }
                       
                        
                        Text(movie.overview)
                            .font(.subheadline)
                        
                        
                        Spacer()
                    }.padding()
                        .navigationBarTitleDisplayMode(.inline)
                }.onAppear {
                    let trimmedPosterPath = movie.poster_path?.trimmingCharacters(in: .whitespacesAndNewlines)
                    fetchImage(posterPath: trimmedPosterPath ?? "") { image in
                        if let image = image {
                            self.movieImage = image
                        }
                    }
                }
            }
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    @State static var favourites: [Movie] = []
    static var previews: some View {
        MovieDetailView(movie: (Movie(title: "Cyprus",
                                      id: 65356,
                                      posterPath: "https://cdn2.thecatapi.com/images/unX21IBVB.jpg", overview: "Loving, loyal, social and inquisitive, the Cyprus cat forms strong ties with their families and love nothing more than to be involved in everything that goes on in their surroundings. They are not overly active by nature which makes them the perfect companion for people who would like to share their homes with a laid-back relaxed feline companion.")),favourites: $favourites)
    }
}
