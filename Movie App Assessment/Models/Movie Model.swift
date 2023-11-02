//
//  Movie Model.swift
//  Movie App Assessment
//
//  Created by Pankaj, Ashutosh, Isiri on 13/09/22.
//


import Foundation
struct MovieResults: Decodable{
    let results: [Movie] // array of movie object
}


struct Movie: Decodable, Identifiable{ // Decodable protocol

    var id: Int
    let title: String
    let release_date: String
    let backdrop_path: String
    let overview: String
    // let vote_average: Int
}
