//
//  ContentView.swift
//  FetchChallenge
//
//  Created by Brady Robshaw on 6/29/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.desserts) { meal in
                NavigationLink {
                    MealView()
                } label: {
                    Text(meal.mealName)
                }
                .onTapGesture {
                    Task {
                        print("go to \(meal)")
                        await viewModel.gitMeals(forID: meal.id)
                    }
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.gitDesserts()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
