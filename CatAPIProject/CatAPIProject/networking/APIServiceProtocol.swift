//
//  APIServiceProtocol.swift
//  APIServiceProtocol
//
//  Created by Karishma Patil on 16.10.24.
//

import Foundation
import UIKit


protocol APIServiceProtocol {
    func fetchMovies(url: URL?, completion: @escaping(Result<MovieResponse, APIError>) -> Void)
}
