//
//  MovieDetailsViewModel.swift
//  MovieBookingApplication
//
//  Created by Patil, Karishma Vikas on 03/04/23.
//

import Foundation
import SwiftUI
class MovieDetailsViewModel: ObservableObject {
    @Published var movie: Movie?
    @Published var showThirdScreen: Bool = false
    
   init(movie: Movie?) {
       self.movie = movie
    }
}

