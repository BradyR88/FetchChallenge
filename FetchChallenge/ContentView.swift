//
//  ContentView.swift
//  FetchChallenge
//
//  Created by Brady Robshaw on 12/2/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.desserts.meals) { meal in
                NavigationLink {
                    MealView()
                } label: {
                    Text(meal.mealName)
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
