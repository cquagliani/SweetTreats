//
//  AllCategoriesChipsView.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/10/23.
//

import SwiftUI

struct AllCategoriesChipsView: View {
    let categories = ["Beef", "Breakfast", "Chicken", "Dessert", "Goat", "Lamb", "Miscellaneous", "Pasta", "Pork", "Seafood", "Side", "Starter", "Vegan", "Vegetarian"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(categories, id:\.self) { category in
                    CategoryChip(category: category)
                }
            }
        }
        .padding(.horizontal, 16)
    }
}

struct CategoryChip: View {
    let corner = 30.0 // Controls corner radius of all elements in the ZStack
    let shadow = 5.0 // Controls shadow radius of all elements in the ZStack
    let category: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 35, alignment: .center)
                .foregroundColor(.black)
                .cornerRadius(corner)
                .shadow(radius: shadow)
            
            Text(category)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.white)
                .padding()
                .frame(height: 35, alignment: .center)
        }
        .background(in: Capsule())
        
    }
}

struct AllCategories_Previews: PreviewProvider {
    static var previews: some View {
        AllCategoriesChipsView()
    }
}
