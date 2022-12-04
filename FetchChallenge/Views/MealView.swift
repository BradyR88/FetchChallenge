//
//  MealView.swift
//  FetchChallenge
//
//  Created by Brady Robshaw on 12/2/22.
//

import SwiftUI

struct MealView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.recipeSafe.strInstructions)
            
            Divider()
        }
        .navigationTitle(viewModel.recipeSafe.strMeal)
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView()
    }
}
