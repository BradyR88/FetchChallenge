//
//  MealView.swift
//  FetchChallenge
//
//  Created by Brady Robshaw on 6/29/23.
//

import SwiftUI

struct MealView: View {
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: viewModel.recipeImageURL) { image in
                    image.resizable()
                } placeholder: {
                    ZStack {
                        Color.gray
                        ProgressView()
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .scaledToFit()
                
                Divider()
                
                Text(viewModel.recipeSafe.formattedInstructions)
            }
            .padding(.horizontal)
        }
        .navigationTitle(viewModel.recipeSafe.strMeal)
        .alert("Error", isPresented: $viewModel.showingAlert) {
            Button("Retry") {
                Task {
                    await viewModel.gitDesserts()
                }
            }
        } message: {
            Text("There was difficulty retrieving recipe data. Check your Internet connection and try again.")
        }
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView()
            .environmentObject(ViewModel())
    }
}
