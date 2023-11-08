//
//  ContentView.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/6/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AllDessertsView()
                .tag(0)
                .tabItem {
                    Label("Feed", systemImage: "fork.knife")
                }
            StarredRecipesView()
                .tag(1)
                .tabItem {
                    Label("Recipes", systemImage: "book")
                }
            ShoppingView()
                .tag(2)
                .tabItem {
                    Label("Shopping", systemImage: "cart")
                }
        }
        .accentColor(.blue)
    }
}

#Preview {
    ContentView()
}
