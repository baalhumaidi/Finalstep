//
//  PeopleDataStruct.swift
//  Movie Api demo
//
//  Created by admin on 23/12/2021.
//

import Foundation


struct PeopleCharachter: Codable {
    let count: Int
    let next: String
//            let previous: JSONNull?
    let results: [Personinfo]
}

// MARK: - Result
struct Personinfo: Codable {
    let name, height, mass, hair_color: String
    let skin_color, eye_color, birth_year: String
    let gender: String
    let homeworld: String
    let films, species, vehicles, starships: [String]
    let created, edited: String
    let url: String

}
