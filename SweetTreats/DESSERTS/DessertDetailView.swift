//
//  DessertDetailView.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/7/23.
//

import SwiftUI

struct DessertDetailView: View {
    @ObservedObject var data = Details()
    @State private var selectedSegment = 0
    let DessertDetailView: Dessert

        var body: some View {
            VStack {
                URLImage(urlString: DessertDetailView.strMealThumb)
                    .frame(height: 200)
                    .ignoresSafeArea()

                HStack {
                    Text(DessertDetailView.strMeal)
                        .font(.title.weight(.bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    HStack {
                        Button(action: {
                            // Add action for star button
                        }) {
                            Image(systemName: "star")
                                .font(.title)
                                .imageScale(.small)
                        }
                        .padding(2)

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

                Picker("", selection: $selectedSegment) {
                    Text("Instructions").tag(0)
                    Text("Ingredients").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                ScrollView {
                    if selectedSegment == 0 {
                        ForEach(data.dessertDetails, id:\.idMeal) { dessert in
                            Text(dessert.strInstructions)
                        }
                        .padding()
                        
                    } else {
                        Text("Ingredients go here.")
                    }

                    Spacer()
                    .onAppear {
                        data.fetch(idMeal: DessertDetailView.idMeal)
                    }
                }
              
            }
        }
}
