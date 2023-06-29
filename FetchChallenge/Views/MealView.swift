//
//  MealView.swift
//  FetchChallenge
//
//  Created by Brady Robshaw on 6/29/23.
//

import SwiftUI

struct MealView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
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
            
            Text(viewModel.recipeSafe.strInstructions)
            
            
        }
        .padding(.horizontal)
        .navigationTitle(viewModel.recipeSafe.strMeal)
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView()
            .environmentObject(ViewModel())
    }
}
