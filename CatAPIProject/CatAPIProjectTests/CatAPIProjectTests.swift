import XCTest
import SwiftUI
@testable import CatAPIProject

class CatAPIProjectTests: XCTestCase {
    
    func testMovieRowInitialization() {
        let movie = Movie(title: "Test Movie", id: 1 ,posterPath: "", overview: "Test Overview")
        let movieRow = MovieRow(movie: movie)
        
        XCTAssertEqual(movieRow.movie.title, "Test Movie")
        XCTAssertEqual(movieRow.movie.overview, "Test Overview")
    }
    
    func testMovieRowImageFetching() {
        let movie = Movie(title: "Test Movie", id: 2 ,posterPath: "https://image.tmdb.org/t/p/w500/63xYQj1BwRFielxsBDXvHIJyXVm.jpg", overview: "Test Overview")
        let movieRow = MovieRow(movie: movie)
        
        let expectation = self.expectation(description: "Image Fetching")
        
        movieRow.fetchImage(posterPath: movie.poster_path ?? "") { image in
            XCTAssertNotNil(image)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}

// Extend MovieRow to expose fetchImage for testing
extension MovieRow {
    func fetchImage(posterPath: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: posterPath) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    completion(image)
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
}
