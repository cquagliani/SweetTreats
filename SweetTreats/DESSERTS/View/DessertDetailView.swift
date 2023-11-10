//
//  DessertDetailView.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/7/23.
//

import SwiftUI

struct DessertDetailView: View {
    let originalDessert: Dessert
    @ObservedObject var dessertDetails = DetailsViewModel()
    @State private var selectedSegment = 0
    
    var body: some View {
        VStack(spacing: 0) {
            DessertImagesView(dessertDetails: dessertDetails)
            DessertNameCategory(dessertDetails: dessertDetails)
            SegmentedMenuView(dessertDetails: dessertDetails, selectedSegment: $selectedSegment)
                .onAppear {dessertDetails.fetch(idMeal: originalDessert.idMeal)}
        }
    }
}


struct DessertImagesView: View {
    @ObservedObject var dessertDetails: DetailsViewModel
    
    var body: some View {
        ForEach(dessertDetails.dessertDetails, id:\.idMeal) { dessert in
            URLImage(urlString: dessert.strMealThumb, width: 400, height: 150)
                .ignoresSafeArea(.container)
        }
    }
    
}

struct DessertNameCategory: View {
    @ObservedObject var dessertDetails: DetailsViewModel
    
    var body: some View {
        VStack {
            ForEach(dessertDetails.dessertDetails, id:\.idMeal) { dessert in
                Text(dessert.strMeal.capitalized)
                    .font(.title.weight(.bold))
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding(.bottom, 2)
                
                Text(dessert.strCategory)
                    .font(.system(size: 16, weight: .regular))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal)
            
        }
    }
}

struct SegmentedMenuView: View {
    @ObservedObject var dessertDetails: DetailsViewModel
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
            InstructionsView(dessertDetails: dessertDetails)
        } else {
            IngredientsMeasurementsView(dessertDetails: dessertDetails)
        }
    }
}

struct InstructionsView: View {
    @ObservedObject var dessertDetails: DetailsViewModel
    
    var body: some View {
        ScrollView {
            // Validate consistent spacing and display instructions
            ForEach(dessertDetails.dessertDetails, id:\.idMeal) { dessert in
                Text(dessert.strInstructions.replacingOccurrences(of: "\r\n\r\n", with: "\n\n").replacingOccurrences(of: "\r\n", with: "\n\n"))
            }
            .padding()
        }
    }
    
}

struct IngredientsMeasurementsView: View {
    @ObservedObject var dessertDetails: DetailsViewModel
    
    var body: some View {
        List {
            ForEach(dessertDetails.dessertDetails, id:\.idMeal) { dessert in
                ForEach(0..<dessert.ingredients.count, id: \.self) { index in
                    HStack {
                        Text(dessert.ingredients[index].capitalized)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(dessert.measurements[index])
                            .frame(alignment: .trailing)
                    }
                }
            }
        }
        .listStyle(.plain)
    }
}
