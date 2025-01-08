//
//  ImageFetcher.swift
//  CatAPIProject
//
//  Created by Patil, Karishma Vikas on 24/10/24.
//

import Foundation
import SwiftUI

import Foundation
import SwiftUI

func fetchImage(posterPath: String, completion: @escaping (UIImage?) -> Void) {
    let baseURL = "https://image.tmdb.org/t/p/w500"
    let trimmedPosterPath = posterPath.trimmingCharacters(in: .whitespacesAndNewlines)
    let fullURLString = baseURL + trimmedPosterPath
    guard let url = URL(string: fullURLString) else {
        print("Invalid URL: \(fullURLString)")
        completion(nil)
        return
    }

    print("Fetching image from URL: \(url)")

    URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("Error fetching image: \(error.localizedDescription)")
            completion(nil)
            return
        }

        if let data = data, let image = UIImage(data: data) {
            completion(image)
        } else {
            print("Failed to load image data")
            completion(nil)
        }
    }.resume()
}
