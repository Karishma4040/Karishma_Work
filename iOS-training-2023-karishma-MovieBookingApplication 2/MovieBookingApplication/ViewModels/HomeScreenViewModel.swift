//
//  HomeScreenViewModel.swift
//  MovieBookingApplication
//
//  Created by Patil, Karishma Vikas on 03/04/23.
//

import Foundation
import UIKit
import SwiftUI

struct Results: Codable {
    var results: [Movie]
}

struct Movie: Codable {
    let id: Int
    let original_title: String
    let poster_path: String
    let overview: String
}

//MARK: - variables
class HomeScreenViewModel: ObservableObject {
    @Published var shownext: Bool = false
    @Published var showtext: String = ""
    @Published var showSheet: Bool = false
    @Published var movies: Results?
    @Published var items: [Movie] = []
    var itemCopy:[Movie] = []
    var shift: Movie?
    @Published var fetchSearch: [Movie] = []
    
    init(viewModel: Movie? = nil) {
        UITabBar.appearance().backgroundColor = UIColor(Color("Color"))
        UITabBar.appearance().barTintColor = UIColor(Color("Color"))
        self.movies = movies
    }
    
    //MARK: - functions
    func fetch() {
        guard let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=29edf9f0f0117a95424d43f00d8bcb5e&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url ) { data , response ,error  in
            guard  let  data = data, error == nil
            else {
                return
            }
            do {
                let  movies = try JSONDecoder().decode(Results.self, from: data)
                DispatchQueue.main.async {
                    self.movies = movies
                    self.items = movies.results
                    self.itemCopy = movies.results
                }
                
            }
            catch {
                print(error)
            }
            }
        task.resume()
    }
    func searchBar() {
        if showtext.isEmpty {
            movies?.results = itemCopy
        } else
        {
            movies?.results = itemCopy.filter { $0.original_title.prefix(showtext.count) == showtext}
        }
    }
}


   





