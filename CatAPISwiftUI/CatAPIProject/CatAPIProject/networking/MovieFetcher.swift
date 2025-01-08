//
//  BreedFetcher.swift
//  BreedFetcher
//
//  Created by Karishma Patil on 16.10.24.
//

import Foundation
import UIKit


class MovieFetcher: ObservableObject {
    
    @Published var movies :MovieResponse = MovieResponse.init(page: 1, results: [Movie(title: "Cyprus",
                                                                                       id: 65356,
                                                                                       posterPath: "https://cdn2.thecatapi.com/images/unX21IBVB.jpg", overview: "Loving, loyal, social and inquisitive, the Cyprus cat forms strong ties with their families and love nothing more than to be involved in everything that goes on in their surroundings. They are not overly active by nature which makes them the perfect companion for people who would like to share their homes with a laid-back relaxed feline companion.") ], total_pages: 2, total_results: 3)
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    
    let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService() ) {
        self.service = service
       
        fetchAllMovies()
    }
    
    func fetchAllMovies() {
        
        isLoading = true
        errorMessage = nil
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=bc812fbdf44b4a61b4d94e5644f5b276")
        service.fetchMovies(url: url) { [unowned self] result in
            
            DispatchQueue.main.async {
                
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    // print(error.description)
                    print(error)
                case .success(let movies):
                    print("--- sucess with \(movies)")
                    self.movies = movies
                }
            }
        }
        
    }
    
    
    //MARK: preview helpers
    
    static func errorState() -> MovieFetcher {
        let fetcher = MovieFetcher()
        fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    static func successState() -> MovieFetcher {
        let fetcher = MovieFetcher()
        fetcher.movies = MovieResponse.init(page: 1, results: [Movie(title: "Cyprus",
                                                                      id: 65356,
                                                                     posterPath: "https://cdn2.thecatapi.com/images/unX21IBVB.jpg", overview: "Loving, loyal, social and inquisitive, the Cyprus cat forms strong ties with their families and love nothing more than to be involved in everything that goes on in their surroundings. They are not overly active by nature which makes them the perfect companion for people who would like to share their homes with a laid-back relaxed feline companion.") ],total_pages: 2 ,total_results: 3)
        
        return fetcher
    }
}
