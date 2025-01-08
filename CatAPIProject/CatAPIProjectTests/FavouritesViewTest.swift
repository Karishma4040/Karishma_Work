//
//  FavouritesViewTest.swift
//  CatAPIProject
//
//  Created by Patil, Karishma Vikas on 05/11/24.
//

import XCTest
import SwiftUI
@testable import CatAPIProject

class FavouritesViewTests: XCTestCase {
    
    func testFavouritesViewInitialization() {
        let favourites = [Movie]()
        let favouritesView = FavouritesView(favourites: .constant(favourites))
        
        XCTAssertEqual(favouritesView.favourites.count, 0)
    }
    
    func testFavouritesViewWithMovies() {
        let movie = Movie(title: "Test Movie", id: 1, posterPath: "", overview: "Test Overview")
        let favourites = [movie]
        let favouritesView = FavouritesView(favourites: .constant(favourites))
        
        XCTAssertEqual(favouritesView.favourites.count, 1)
        XCTAssertEqual(favouritesView.favourites.first?.title, "Test Movie")
    }
}
