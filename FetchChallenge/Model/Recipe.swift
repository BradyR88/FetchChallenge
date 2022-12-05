//
//  Meal.swift
//  FetchChallenge
//
//  Created by Brady Robshaw on 12/2/22.
//

import Foundation

struct Recipe: Decodable {
    let idMeal: String
    let strMeal: String
    let strDrinkAlternate: String?
    let strCategory: String
    let strArea: String
    let strInstructions: String
    let strMealThumb: String
    let strTags: String?
    let strYoutube: String
    private let strIngredient1: String
    private let strIngredient2: String
    private let strIngredient3: String
    private let strIngredient4: String
    private let strIngredient5: String
    private let strIngredient6: String
    private let strIngredient7: String
    private let strIngredient8: String
    private let strIngredient9: String
    private let strIngredient10: String
    private let strIngredient11: String
    private let strIngredient12: String
    private let strIngredient13: String
    private let strIngredient14: String
    private let strIngredient15: String
    private let strIngredient16: String
    private let strIngredient17: String
    private let strIngredient18: String
    private let strIngredient19: String
    private let strIngredient20: String
    private let strMeasure1: String
    private let strMeasure2: String
    private let strMeasure3: String
    private let strMeasure4: String
    private let strMeasure5: String
    private let strMeasure6: String
    private let strMeasure7: String
    private let strMeasure8: String
    private let strMeasure9: String
    private let strMeasure10: String
    private let strMeasure11: String
    private let strMeasure12: String
    private let strMeasure13: String
    private let strMeasure14: String
    private let strMeasure15: String
    private let strMeasure16: String
    private let strMeasure17: String
    private let strMeasure18: String
    private let strMeasure19: String
    private let strMeasure20: String
    let strSource: String
    let strImageSource: String?
    let strCreativeCommonsConfirmed: String?
    let dateModified: String?
    
    var ingredeants: [(String,String)] {
        var list: [(String,String)] = []
        
        list.sppendNoBlank((strIngredient1, strMeasure1))
        list.sppendNoBlank((strIngredient2, strMeasure2))
        list.sppendNoBlank((strIngredient3, strMeasure3))
        list.sppendNoBlank((strIngredient4, strMeasure4))
        list.sppendNoBlank((strIngredient5, strMeasure5))
        list.sppendNoBlank((strIngredient6, strMeasure6))
        list.sppendNoBlank((strIngredient7, strMeasure7))
        list.sppendNoBlank((strIngredient8, strMeasure8))
        list.sppendNoBlank((strIngredient9, strMeasure9))
        list.sppendNoBlank((strIngredient10, strMeasure10))
        list.sppendNoBlank((strIngredient11, strMeasure11))
        list.sppendNoBlank((strIngredient12, strMeasure12))
        list.sppendNoBlank((strIngredient13, strMeasure13))
        list.sppendNoBlank((strIngredient14, strMeasure14))
        list.sppendNoBlank((strIngredient15, strMeasure15))
        list.sppendNoBlank((strIngredient16, strMeasure16))
        list.sppendNoBlank((strIngredient17, strMeasure17))
        list.sppendNoBlank((strIngredient18, strMeasure18))
        list.sppendNoBlank((strIngredient19, strMeasure19))
        list.sppendNoBlank((strIngredient20, strMeasure20))
        
        return list
    }
    
    static let example = Recipe(idMeal: "00000", strMeal: "Loding", strDrinkAlternate: "", strCategory: "", strArea: "", strInstructions: "", strMealThumb: "", strTags: "", strYoutube: "", strIngredient1: "", strIngredient2: "", strIngredient3: "", strIngredient4: "", strIngredient5: "", strIngredient6: "", strIngredient7: "", strIngredient8: "", strIngredient9: "", strIngredient10: "", strIngredient11: "", strIngredient12: "", strIngredient13: "", strIngredient14: "", strIngredient15: "", strIngredient16: "", strIngredient17: "", strIngredient18: "", strIngredient19: "", strIngredient20: "", strMeasure1: "", strMeasure2: "", strMeasure3: "", strMeasure4: "", strMeasure5: "", strMeasure6: "", strMeasure7: "", strMeasure8: "", strMeasure9: "", strMeasure10: "", strMeasure11: "", strMeasure12: "", strMeasure13: "", strMeasure14: "", strMeasure15: "", strMeasure16: "", strMeasure17: "", strMeasure18: "", strMeasure19: "", strMeasure20: "", strSource: "", strImageSource: "", strCreativeCommonsConfirmed: "", dateModified: "")
}

extension Array where Element == (String,String) {
    mutating func sppendNoBlank(_ newElement: Element) {
        if newElement.0 != "" || newElement.1 != "" {
            self.append(newElement)
        }
    }
}
