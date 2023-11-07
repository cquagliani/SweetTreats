//
//  DessertDetailView.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/7/23.
//

import SwiftUI

struct DessertDetailView: View {
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

                if selectedSegment == 0 {
                    Text("Display Instructions here")
                        .font(.body)
                        .padding()
                } else {
                    Text("Display Ingredients here")
                        .font(.body)
                        .padding()
                }

                Spacer()
            }
        }
}
