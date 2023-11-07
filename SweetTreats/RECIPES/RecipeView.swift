//
//  RecipeView.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/6/23.
//

import SwiftUI

struct RecipeView: View {
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
                Label("No saved recipes", systemImage: "fork.knife")
            }, description: {
                Text("Starred recipes will appear here.")
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
            }, actions: {
                Button(action: {}) {
                    Text("Browse new recipes")
                }
            })
        }
    }
}

#Preview {
    RecipeView()
}
