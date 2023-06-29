//
//  ViewModel.swift
//  FetchChallenge
//
//  Created by Brady Robshaw on 6/29/23.
//

import Foundation
import SwiftUI

@MainActor
class ViewModel: ObservableObject {
    
    @Published var desserts: [Dessert] = []
    @Published private var recipe: Recipe? = nil
    private(set) var recipeImageURL: URL? = nil
    
    var recipeSafe: Recipe {
        recipe ?? Recipe.example
    }
    
    func gitDesserts()async {
        guard desserts.isEmpty else { return }
        
        do {
            let data: [String:[Dessert]] = try await APIGitter().fetch(.dessertList)
            DispatchQueue.main.async {
                self.desserts = data["meals"]?.sorted() ?? []
            }
        }
        catch {
            // do error handaling hear
            print("\(error)")
        }
    }
    
    func gitMeal(_ meal: Dessert)async {
        recipeImageURL = meal.imageURL
        
        do {
            let data: [String:[Recipe]] = try await APIGitter().fetch(.meal(id: meal.id))
            DispatchQueue.main.async {
                self.recipe = data["meals"]?.first ?? nil
            }
        }
        catch {
            // do error handaling hear
            print("\(error)")
        }
    }
}
