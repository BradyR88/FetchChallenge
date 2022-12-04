//
//  Dessert.swift
//  FetchChallenge
//
//  Created by Brady Robshaw on 12/2/22.
//

import Foundation

struct Dessert: Comparable, Decodable, Identifiable {
    let mealName: String
    let imageStrURL: String
    let id: String
    
    var imageURL: URL? {
        URL(string: imageStrURL)
    }
    
    static func < (lhs: Dessert, rhs: Dessert) -> Bool {
        lhs.mealName < rhs.mealName
    }
    
    private enum CodingKeys: String, CodingKey {
        case mealName = "strMeal"
        case imageStrURL = "strMealThumb"
        case id = "idMeal"
    }
    
}
