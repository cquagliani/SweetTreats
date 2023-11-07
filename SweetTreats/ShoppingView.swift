//
//  ShoppingView.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/6/23.
//

import SwiftUI

struct ShoppingView: View {
    var body: some View {
        NavigationStack {
//            List {
//                ForEach() { recipe in
//                    NavigationLink {
//                        RecipeView(recipe)
//                    } label: {
//                        Text(recipe.name)
//                    }
//                }
//            }
            // if recipes array is empty
            ContentUnavailableView(label: {
                Label("Your shopping list is empty", systemImage: "list.bullet.rectangle.portrait")
            }, description: {
                Text("Add ingredients to your shopping list directly from any recipe.")
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
            }, actions: {
                Button(action: {}) {
                    Text("Browse recipes")
                }
            })
        }
    }
}

#Preview {
    ShoppingView()
}
