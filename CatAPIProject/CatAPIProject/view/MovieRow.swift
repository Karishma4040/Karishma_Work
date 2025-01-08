//
//  BreedRow.swift
//  BreedRow
//
//  Created by Karishma Patil on 16.10.24.
//

import SwiftUI

struct MovieRow: View {
    let movie: Movie
    let imageSize: CGFloat = 100
    @State private var movieImage: UIImage? = nil
    var body: some View {
        HStack {
            HStack {
                if let movieImage = movieImage {
                    Image(uiImage: movieImage)
                        .resizable()
                        .frame(width: 100, height: 150)
                        .cornerRadius(8)
                } else {
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 100, height: 150)
                        .cornerRadius(8)
                }
                VStack(alignment: .leading) {
                    Text(movie.title)
                        .font(.headline)
                    
                    Text(movie.overview)
                        .font(.subheadline)
                        .lineLimit(3)
                }
            }
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


struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieRow(movie: (Movie(title: "Cyprus",
                               id: 65356,
                               posterPath: "https://cdn2.thecatapi.com/images/unX21IBVB.jpg", overview: "Loving, loyal, social and inquisitive, the Cyprus cat forms strong ties with their families and love nothing more than to be involved in everything that goes on in their surroundings. They are not overly active by nature which makes them the perfect companion for people who would like to share their homes with a laid-back relaxed feline companion.")))
        .previewLayout(.fixed(width: 400, height: 200))
    }
    
}