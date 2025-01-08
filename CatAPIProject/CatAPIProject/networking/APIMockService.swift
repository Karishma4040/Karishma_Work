//
//  APIMockService.swift
//  APIMockService
//
//  Created by Karishma Patil on 16.10.24.
//

import Foundation
import UIKit

struct APIMockService: APIServiceProtocol {
    
    var result: Result<MovieResponse, APIError>
    
    func fetchMovies(url: URL?, completion: @escaping (Result<MovieResponse, APIError>) -> Void) {
        completion(result)
    }
    
    
    
    
}
