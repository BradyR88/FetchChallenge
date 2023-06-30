//
//  Meal.swift
//  FetchChallenge
//
//  Created by Brady Robshaw on 6/29/23.
//

import Foundation

struct Recipe: Decodable {
    let idMeal: String
    let strMeal: String
    let strInstructions: String
    var ingredeants: [String]
    var measures: [String]
    
    var formattedInstructions: String {
        var formatted = ""
        for (index, ingredient) in ingredeants.enumerated() {
            if !ingredient.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                formatted.append("\(measures[index]) - \(ingredient)\n")
            }
        }
        formatted.append("\n")
        formatted.append(strInstructions)
        return formatted
    }
    
    enum CodingKeys: String, CaseIterable, CodingKey {
        case idMeal
        case strMeal
        case strInstructions
        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
    }
    
    static let example = Recipe(idMeal: "53049", strMeal: "Apam balik", strInstructions: "Mix milk, oil and egg together. Sift flour, baking powder and salt into the mixture. Stir well until all ingredients are combined evenly.\r\n\r\nSpread some batter onto the pan. Spread a thin layer of batter to the side of the pan. Cover the pan for 30-60 seconds until small air bubbles appear.\r\n\r\nAdd butter, cream corn, crushed peanuts and sugar onto the pancake. Fold the pancake into half once the bottom surface is browned.\r\n\r\nCut into wedges and best eaten when it is warm.", ingredeants: ["Sugar"], measures: ["3 tsp"])
}

extension Recipe {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.idMeal = try container.decode(String.self, forKey: .idMeal)
        self.strMeal = try container.decode(String.self, forKey: .strMeal)
        self.strInstructions = try container.decode(String.self, forKey: .strInstructions)
        
        var ingredients: [String] = []
        for key in CodingKeys.allCases.filter({ key in key.rawValue.contains("strIngredient") }) {
            let newElement = try container.decode(String.self, forKey: key)
            ingredients.append(newElement)
        }
        self.ingredeants = ingredients
        
        var measures: [String] = []
        for key in CodingKeys.allCases.filter({ key in key.rawValue.contains("strMeasure") }) {
            let newElement = try container.decode(String.self, forKey: key)
            measures.append(newElement)
        }
        self.measures = measures
    }
}

extension Array where Element == (String,String) {
    mutating func sppendNoBlank(_ newElement: Element) {
        if newElement.0 != "" || newElement.1 != "" {
            self.append(newElement)
        }
    }
}
