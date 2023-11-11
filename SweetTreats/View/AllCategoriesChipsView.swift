//
//  AllCategoriesChipsView.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/10/23.
//

import SwiftUI

struct AllCategoriesChipsView: View {
    @State private var selectedButton: Int?
    @Binding var selectedCategory: String
    
    let categories = ["Beef", "Breakfast", "Chicken", "Dessert", "Goat", "Lamb", "Miscellaneous", "Pasta", "Pork", "Seafood", "Side", "Starter", "Vegan", "Vegetarian"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<14) { index in
                    CategoryChip(
                        category: categories[index],
                        isSelected: Binding(
                            get: { self.selectedCategory == categories[index] },
                            set: { isSelected in
                                if isSelected {
                                    self.selectedCategory = categories[index]
                                }
                            }
                        )
                    )
                }
            }
        }
        .padding(.horizontal, 16)
    }
}

struct CategoryChip: View {
    let corner = 30.0
    let shadow = 2.0
    let primaryColor = Color.white
    let accentColor = Color.black
    let category: String
    
    @Binding var isSelected: Bool
    
    var body: some View {
        Button(action: {
            self.isSelected.toggle()
            print("You selected: \(self.category)")
        }) {
            ZStack {
                Text(category)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(isSelected ? primaryColor : accentColor)
                    .padding()
                    .frame(height: 35, alignment: .center)
            }
            .cornerRadius(corner)
            .overlay(
                RoundedRectangle(cornerRadius: corner)
                    .stroke(Color.black, lineWidth: isSelected ? 0 : 0.25)
                    .shadow(radius: shadow)
                    
            )
            .background(isSelected ? accentColor : primaryColor, in: Capsule())
        }
    }
}
