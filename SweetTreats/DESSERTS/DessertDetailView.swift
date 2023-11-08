//
//  DessertDetailView.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/7/23.
//

import SwiftUI

struct DessertDetailView: View {
    let originalDessert: Dessert
    @ObservedObject var dessertDetails = Details()
    @State private var selectedSegment = 0
    
    var body: some View {
        VStack(spacing: 0) {
            DessertImagesView(dessertDetails: dessertDetails)
            DessertNameStarIcon(dessertDetails: dessertDetails)
            SegmentedMenuView(dessertDetails: dessertDetails, selectedSegment: $selectedSegment)
                .onAppear {dessertDetails.fetch(idMeal: originalDessert.idMeal)}
        }
    }
}


struct DessertImagesView: View {
    @ObservedObject var dessertDetails: Details
    
    var body: some View {
        ForEach(dessertDetails.dessertDetails, id:\.idMeal) { dessert in
            URLImage(urlString: dessert.strMealThumb, width: 400, height: 150)
                .ignoresSafeArea(.container)
        }
    }
    
}

struct DessertNameStarIcon: View {
    @ObservedObject var dessertDetails: Details
    
    var body: some View {
        HStack {
            ForEach(dessertDetails.dessertDetails, id:\.idMeal) { dessert in
                Text(dessert.strMeal)
                    .font(.title.weight(.bold))
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding()
            }
            StarIcon()
            .padding()
        }
    }
    
}

struct SegmentedMenuView: View {
    @ObservedObject var dessertDetails: Details
    @Binding var selectedSegment: Int
    
    var body: some View {
        // Organize ingredients and measurements into iterable arrays
        let (ingredients, measurements) = getIngredientsMeasurements(dessertDetails: dessertDetails.dessertDetails)
        
        // Manages the segmented menu view (i.e. whether to show instructions or ingredients)
        Picker("", selection: $selectedSegment) {
            Text("Instructions").tag(0)
            Text("Ingredients").tag(1)
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
        
        if selectedSegment == 0 {
            ScrollView {
                ForEach(dessertDetails.dessertDetails, id:\.idMeal) { dessert in
                    Text(dessert.strInstructions)
                }
                .padding()
            }
        } else {
            List {
                ForEach(0..<min(ingredients.count, measurements.count), id: \.self) { index in
                    if !ingredients[index].isEmpty || !measurements[index].isEmpty { // filter out any null or empty values
                        HStack {
                            Text(ingredients[index])
                            Spacer()
                            Text(measurements[index])
                        }
                    }
                }
            }
            .listStyle(.plain)
        }
        Spacer()

    }
    
    // Function to organize all ingredients and measurements into arrays to display easier
    private func getIngredientsMeasurements(dessertDetails: [DessertDetail]) -> (ingredients: [String], measurements: [String]) {
        var ingredients: [String] = []
        var measurements: [String] = []
        
        for dessert in dessertDetails {
            ingredients.append(dessert.strIngredient1)
            ingredients.append(dessert.strIngredient2)
            ingredients.append(dessert.strIngredient3)
            ingredients.append(dessert.strIngredient4)
            ingredients.append(dessert.strIngredient5)
            ingredients.append(dessert.strIngredient6)
            ingredients.append(dessert.strIngredient7)
            ingredients.append(dessert.strIngredient8)
            ingredients.append(dessert.strIngredient9)
            ingredients.append(dessert.strIngredient10)
            
            measurements.append(dessert.strMeasure1)
            measurements.append(dessert.strMeasure2)
            measurements.append(dessert.strMeasure3)
            measurements.append(dessert.strMeasure4)
            measurements.append(dessert.strMeasure5)
            measurements.append(dessert.strMeasure6)
            measurements.append(dessert.strMeasure7)
            measurements.append(dessert.strMeasure8)
            measurements.append(dessert.strMeasure9)
            measurements.append(dessert.strMeasure10)
        }
        
        return (ingredients, measurements)
    }
}
