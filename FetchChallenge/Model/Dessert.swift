//
//  Dessert.swift
//  FetchChallenge
//
//  Created by Brady Robshaw on 6/29/23.
//

import Foundation

struct Dessert {
    let mealName: String
    private let imageStrURL: String
    let id: String
    
    var imageURL: URL? {
        URL(string: imageStrURL)
    }
    
    private enum CodingKeys: String, CodingKey {
        case mealName = "strMeal"
        case imageStrURL = "strMealThumb"
        case id = "idMeal"
    }
}

extension Dessert: Comparable {
    static func < (lhs: Dessert, rhs: Dessert) -> Bool {
        lhs.mealName < rhs.mealName
    }
}

extension Dessert: Decodable { }
extension Dessert: Identifiable { }
