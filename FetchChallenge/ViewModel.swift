//
//  ViewModel.swift
//  FetchChallenge
//
//  Created by Brady Robshaw on 12/2/22.
//

import Foundation

@MainActor
class ViewModel: ObservableObject {
    
    @Published var desserts: TestTest = TestTest(meals: [])
    @Published var meal: Meal? = nil
    
    func gitDesserts()async {
        //guard desserts.isEmpty else { return }
        
        do {
            let data: TestTest = try await APIGitter().fetch(.dessertList)
            DispatchQueue.main.async {
                self.desserts = data
            }
        }
        catch {
            // do error handaling hear
            print("\(error)")
        }
    }
    
    func gitMeals(for id: Int)async {
        do {
            let data: Meal = try await APIGitter().fetch(.meal(id: String(id)))
            DispatchQueue.main.async {
                self.meal = data
            }
        }
        catch {
            // do error handaling hear
            print("\(error)")
        }
    }
}
