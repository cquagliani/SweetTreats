//
//  DessertDetailView.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/7/23.
//

import SwiftUI

struct DessertDetailView: View {
    let OriginalDessert: Dessert
    
    @ObservedObject var data = Details()
    @State private var selectedSegment = 0
    
    var body: some View {
        
        let (ingredients, measurements) = getIngredientsMeasurements(data: data.dessertDetails)
        
        VStack {
            ForEach(data.dessertDetails, id:\.idMeal) { dessert in
                URLImage(urlString: dessert.strMealThumb)
                    .ignoresSafeArea()
            }
            
            HStack {
                ForEach(data.dessertDetails, id:\.idMeal) { dessert in
                    Text(dessert.strMeal)
                        .font(.title.weight(.bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                }
                
                HStack {
                    StarIcon()
                    Button(action: {
                        // Add action for share button
                    }) {
                        Image(systemName: "square.and.arrow.up")
                            .font(.title)
                            .imageScale(.small)
                    }
                    .padding(2)
                    
                }
                .padding()
            }
            
            // Manages the segmented menu view (i.e. whether to show instructions or ingredients)
            Picker("", selection: $selectedSegment) {
                Text("Instructions").tag(0)
                Text("Ingredients").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            if selectedSegment == 0 {
                ScrollView {
                    ForEach(data.dessertDetails, id:\.idMeal) { dessert in
                        Text(dessert.strInstructions)
                    }
                    .padding()
                }
            } else {
                List {
                    ForEach(0..<min(ingredients.count, measurements.count), id: \.self) { index in
                        HStack {
                            Text(ingredients[index])
                            Spacer()
                            Text(measurements[index])
                        }
                    }
                }
                .listStyle(.plain)
            }
            Spacer()
                .onAppear {
                    data.fetch(idMeal: OriginalDessert.idMeal)
                }
        }
    }
    
    // Function to organize all ingredients and measurements into arrays to display easier
    private func getIngredientsMeasurements(data: [DessertDetail]) -> (ingredients: [String], measurements: [String]) {
        var ingredients: [String] = []
        var measurements: [String] = []
        
        for dessert in data {
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
