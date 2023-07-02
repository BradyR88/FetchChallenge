//
//  Meal.swift
//  FetchChallenge
//
//  Created by Brady Robshaw on 6/29/23.
//

import Foundation

struct Recipe {
    let idMeal: String
    let strMeal: String
    let strInstructions: String
    var ingredients: [String]
    var measures: [String]
    
    var formattedInstructions: String {
        var formatted = ""
        for (index, ingredient) in ingredients.enumerated() {
            if !ingredient.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                formatted.append("\(measures[index]) - \(ingredient)\n")
            }
        }
        formatted.append("\n")
        formatted.append(strInstructions)
        return formatted
    }
    
    static let example = Recipe(idMeal: "53049", strMeal: "Apam balik", strInstructions: "Mix milk, oil and egg together. Sift flour, baking powder and salt into the mixture. Stir well until all ingredients are combined evenly.\r\n\r\nSpread some batter onto the pan. Spread a thin layer of batter to the side of the pan. Cover the pan for 30-60 seconds until small air bubbles appear.\r\n\r\nAdd butter, cream corn, crushed peanuts and sugar onto the pancake. Fold the pancake into half once the bottom surface is browned.\r\n\r\nCut into wedges and best eaten when it is warm.", ingredients: ["Sugar"], measures: ["3 tsp"])
}

extension Recipe: Decodable { }

extension Recipe: Equatable { }

extension Recipe {
    struct CustomKey: CodingKey {
        var stringValue: String
        
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        
        //include this to satisfy the protocol
        var intValue: Int?
        
        init?(intValue: Int) {
            return nil
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CustomKey.self)
        
        self.idMeal = try container.decode(String.self, forKey: CustomKey(stringValue: "idMeal")!)
        self.strMeal = try container.decode(String.self, forKey: CustomKey(stringValue: "strMeal")!)
        self.strInstructions = try container.decode(String.self, forKey: CustomKey(stringValue: "strInstructions")!)
        
        var _ingredients: [String?] = []
        var _measures: [String?] = []
        for key in container.allKeys.sorted(by: { $0.stringValue <= $1.stringValue }) {
            switch key.stringValue {
            case let value where value.contains("strIngredient"):
                let newValue = try? container.decode(String.self, forKey: CustomKey(stringValue: value)!)
                _ingredients.append(newValue)
            case let value where value.contains("strMeasure"):
                let newValue = try? container.decode(String.self, forKey: CustomKey(stringValue: value)!)
                _measures.append(newValue)
            default:
                continue
            }
        }
        
        self.ingredients = _ingredients.compactMap { $0 }.filter{ !$0.isEmpty }
        self.measures = _measures.compactMap { $0 }.filter{ !$0.isEmpty }
    }
}

