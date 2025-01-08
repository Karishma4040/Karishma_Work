//
//  CatBreed.swift
//  CatBreed
//
//  Created by Karishma Patil on 16.10.24.
//

import Foundation

/*
 [{"weight":{"imperial":"7  -  10","metric":"3 - 5"},"id":"abys","name":"Abyssinian","cfa_url":"http://cfa.org/Breeds/BreedsAB/Abyssinian.aspx","vetstreet_url":"http://www.vetstreet.com/cats/abyssinian","vcahospitals_url":"https://vcahospitals.com/know-your-pet/cat-breeds/abyssinian","temperament":"Active, Energetic, Independent, Intelligent, Gentle","origin":"Egypt","country_codes":"EG","country_code":"EG","description":"The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.","life_span":"14 - 15","indoor":0,"lap":1,"alt_names":"","adaptability":5,"affection_level":5,"child_friendly":3,"dog_friendly":4,"energy_level":5,"grooming":1,"health_issues":2,"intelligence":5,"shedding_level":2,"social_needs":5,"stranger_friendly":5,"vocalisation":1,"experimental":0,"hairless":0,"natural":1,"rare":0,"rex":0,"suppressed_tail":0,"short_legs":0,"wikipedia_url":"https://en.wikipedia.org/wiki/Abyssinian_(cat)","hypoallergenic":0,"reference_image_id":"0XYvRd7oD","image":{"id":"0XYvRd7oD","width":1204,"height":1445,"url":"https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg"}}]

 */


struct MovieResponse: Decodable {
    
   var page:Int
   var results: [Movie]
    var total_pages: Int
    var total_results: Int
}
 
struct Movie: Codable, Identifiable  {
    let id: Int
    let title: String
    let poster_path: String?
    let overview: String
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(Int.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        overview = try values.decode(String.self, forKey: .overview)
        poster_path = try values.decodeIfPresent(String.self, forKey: .poster_path)
    }
    init(title: String, id: Int, posterPath: String, overview: String){
        self.title = title
        self.id = id
        self.poster_path = posterPath
        self.overview = overview
       
    }
   static func example1() -> MovieResponse {
       return MovieResponse(page: 2 ,results: [Movie(title: "Cyprus",
                                               id: 65356,
                                                     posterPath: "https://cdn2.thecatapi.com/images/unX21IBVB.jpg", overview: "Loving, loyal, social and inquisitive, the Cyprus cat forms strong ties with their families and love nothing more than to be involved in everything that goes on in their surroundings. They are not overly active by nature which makes them the perfect companion for people who would like to share their homes with a laid-back relaxed feline companion.")], total_pages: 5,total_results: 7)
        }
        
    static func example2() -> MovieResponse {
        return MovieResponse(page: 1, results: [Movie(title: "Cyprus",
                                                 id: 65356,
                                                      posterPath: "https://cdn2.thecatapi.com/images/unX21IBVB.jpg", overview: "Loving, loyal, social and inquisitive, the Cyprus cat forms strong ties with their families and love nothing more than to be involved in everything that goes on in their surroundings. They are not overly active by nature which makes them the perfect companion for people who would like to share their homes with a laid-back relaxed feline companion.")],total_pages: 1,total_results: 4)
            
        }
    
}

//struct Breed: Codable, CustomStringConvertible, Identifiable {
//    let id: String
//    let name: String
//    let temperament: String
//    let breedExplaination: String
//    let energyLevel: Int
//    let isHairless: Bool
//    let image: BreedImage?
//    
//    var description: String {
//        return "breed with name: \(name) and id \(id), energy level: \(energyLevel) isHairless: \(isHairless ? "YES" : "NO")"
//    }
//    
////    enum CodingKeys: String, CodingKey {
////        case id
////        case name
////        case temperament
////        case breedExplaination = "description"
////        case energyLevel = "energy_level"
////        case isHairless = "hairless"
////        case image
////    }
//    
//    
//    init(name: String, id: String, explaination: String, temperament: String,
//         energyLevel: Int, isHairless: Bool, image: BreedImage?){
//        self.name = name
//        self.id = id
//        self.breedExplaination = explaination
//        self.energyLevel = energyLevel
//        self.temperament = temperament
//        self.image = image
//        self.isHairless = isHairless
//    }
//    
 




