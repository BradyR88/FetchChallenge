//
//  ViewModel.swift
//  FetchChallenge
//
//  Created by Brady Robshaw on 12/2/22.
//

import Foundation

@MainActor
class ViewModel: ObservableObject {
    
    @Published var desserts: [Dessert] = []
    @Published private var recipe: Recipe? = nil
    
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
    
    func gitMeals(forID id: String)async {
        do {
            let data: [String:[Recipe]] = try await APIGitter().fetch(.meal(id: id))
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
