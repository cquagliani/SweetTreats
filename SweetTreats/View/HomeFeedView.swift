//
//  HomeFeedView.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/10/23.
//

import SwiftUI

struct HomeFeedView: View {
    @StateObject var viewModel: RecipeViewModel
    @ObservedObject var recipeDetails: DetailsViewModel
    
    @State private var selectedCategory: String = "Beef"

    var body: some View {
        NavigationStack {
            AllCategoriesChipsView(selectedCategory: $selectedCategory)
                .padding(.top, 15)

            List(viewModel.recipes, id: \.idMeal) { recipe in
                NavigationLink(destination: RecipeDetailView(originalRecipe: recipe, recipeDetails: recipeDetails)) {
                    RecipeCardView(recipe: recipe)
                }
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                .padding(.bottom, -10)
            }
            .listStyle(.plain)
            .navigationTitle("Discover")
            .onAppear {
                viewModel.fetch(strCategory: selectedCategory)
            }
            .onChange(of: selectedCategory) {
                viewModel.fetch(strCategory: selectedCategory)
            }
        }
    }
}

//    .onAppear {recipeDetails.fetch(idMeal: originalDessert.idMeal)}

struct HomeFeedView_Previews: PreviewProvider {
    static var previews: some View {
        HomeFeedView(
            viewModel: RecipeViewModel(networkService: NetworkService()),
            recipeDetails: DetailsViewModel(networkService: NetworkService())
        )
    }
}
