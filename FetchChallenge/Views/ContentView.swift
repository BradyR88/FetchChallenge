//
//  ContentView.swift
//  FetchChallenge
//
//  Created by Brady Robshaw on 6/29/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    @State private var showingDestination = false
    
    var body: some View {
        NavigationStack {
            List(viewModel.desserts) { meal in
                Button {
                    Task {
                        print("go to \(meal)")
                        await viewModel.gitMeal(meal)
                        showingDestination = true
                    }
                } label: {
                    Text(meal.mealName)
                        .foregroundColor(.primary)
                }
            }
            .navigationDestination(isPresented: $showingDestination) {
                MealView()
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
            .environmentObject(ViewModel())
    }
}
