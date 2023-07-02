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
                    showingDestination = true
                    Task {
                        await viewModel.getMeal(meal)
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
                await viewModel.getDesserts()
            }
        }
        .alert("Error", isPresented: $viewModel.showingAlert) {
            Button("Retry") {
                Task {
                    await viewModel.getDesserts()
                }
            }
        } message: {
            Text("There was difficulty retrieving recipe data. Check your Internet connection and try again.")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}
