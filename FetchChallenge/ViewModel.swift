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
    @Published var showingAlert = false
    
    private(set) var recipeImageURL: URL? = nil
    
    var recipeSafe: Recipe {
        recipe ?? Recipe(idMeal: "", strMeal: "Loading", strInstructions: "", ingredients: [], measures: [])
    }
    
    func getDesserts()async {
        guard desserts.isEmpty else { return }
        
        do {
            let data: [String:[Dessert]] = try await APIGetter().fetch(.dessertList)
            DispatchQueue.main.async {
                self.desserts = data["meals"]?.sorted() ?? []
            }
        }
        catch {
            showingAlert = true
        }
    }
    
    func getMeal(_ meal: Dessert)async {
        recipeImageURL = meal.imageURL
        
        do {
            let data: [String:[Recipe]] = try await APIGetter().fetch(.meal(id: meal.id))
            DispatchQueue.main.async {
                self.recipe = data["meals"]?.first ?? nil
            }
        }
        catch {
            showingAlert = true
        }
    }
}

extension ViewModel {
    convenience init(isPreview: Bool = false) {
        self.init()
        recipe = .example
    }
}
