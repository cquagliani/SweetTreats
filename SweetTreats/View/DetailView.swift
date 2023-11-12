//
//  RecipeDetailView.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/7/23.
//

import SwiftUI

struct RecipeDetailView: View {
    let originalRecipe: Recipe
    @ObservedObject var recipeDetails: DetailsViewModel
    @State private var selectedSegment = 0
    
    var body: some View {
        VStack(spacing: 0) {
            RecipeImagesView(recipeDetails: recipeDetails)
            RecipeNameCategory(recipeDetails: recipeDetails)
            SegmentedMenuView(recipeDetails: recipeDetails, selectedSegment: $selectedSegment)
                .onAppear {recipeDetails.fetch(idMeal: originalRecipe.idMeal)}
        }
    }
}

struct RecipeImagesView: View {
    @ObservedObject var recipeDetails: DetailsViewModel
    
    var body: some View {
        ForEach(recipeDetails.recipeDetails, id:\.idMeal) { recipe in
            URLImage(urlString: recipe.strMealThumb, width: 400, height: 150)
                .ignoresSafeArea(.container)
        }
    }
    
}

struct RecipeNameCategory: View {
    @ObservedObject var recipeDetails: DetailsViewModel
    
    var body: some View {
        VStack {
            ForEach(recipeDetails.recipeDetails, id:\.idMeal) { recipe in
                VStack {
                    Text(recipe.strMeal.capitalized)
                        .font(.title.weight(.bold))
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(.bottom, 2)
                    
                    Text(recipe.strCategory)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding(.horizontal)
            
        }
    }
}

struct SegmentedMenuView: View {
    @ObservedObject var recipeDetails: DetailsViewModel
    @Binding var selectedSegment: Int
    
    var body: some View {
        // Manages the segmented menu view (i.e. whether to show instructions or ingredients)
        Picker("", selection: $selectedSegment) {
            Text("Instructions").tag(0)
            Text("Ingredients").tag(1)
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
                
        if selectedSegment == 0 {
            InstructionsView(recipeDetails: recipeDetails)
        } else {
            IngredientsMeasurementsView(recipeDetails: recipeDetails)
        }
    }
}

struct InstructionsView: View {
    @ObservedObject var recipeDetails: DetailsViewModel
    
    var body: some View {
        ScrollView {
            // Validate consistent spacing and display instructions
            ForEach(recipeDetails.recipeDetails, id:\.idMeal) { recipe in
                Text(recipe.strInstructions.replacingOccurrences(of: "\r\n\r\n", with: "\n\n").replacingOccurrences(of: "\r\n", with: "\n\n"))
            }
            .padding()
        }
    }
    
}

struct IngredientsMeasurementsView: View {
    @ObservedObject var recipeDetails: DetailsViewModel
    
    var body: some View {
        List {
            ForEach(recipeDetails.recipeDetails, id:\.idMeal) { recipe in
                ForEach(0..<recipe.ingredients.count, id: \.self) { index in
                    HStack {
                        Text(recipe.ingredients[index].capitalized)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(recipe.measurements[index])
                            .frame(alignment: .trailing)
                    }
                }
            }
        }
        .listStyle(.plain)
    }
}
