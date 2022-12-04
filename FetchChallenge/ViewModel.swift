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
    @Published var recipe: Recipe? = nil
    
    func gitDesserts()async {
        guard desserts.isEmpty else { return }
        
        do {
            let data: MealTypes = try await APIGitter().fetch(.dessertList)
            DispatchQueue.main.async {
                self.desserts = data.meals
            }
        }
        catch {
            // do error handaling hear
            print("\(error)")
        }
    }
    
    func gitMeals(for id: Int)async {
        do {
            let data: Recipe = try await APIGitter().fetch(.meal(id: String(id)))
            DispatchQueue.main.async {
                self.recipe = data
            }
        }
        catch {
            // do error handaling hear
            print("\(error)")
        }
    }
}
