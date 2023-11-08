//
//  AllDessertsList.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/6/23.
//

import SwiftUI

struct AllDessertsView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.Desserts, id: \.idMeal) { dessert in
                NavigationLink(destination: DessertDetailView(OriginalDessert: dessert)) {
                    DessertCard(dessert: dessert)
                }
            }
            .padding(.top, 20)
            .listStyle(.plain)
            .navigationTitle("All Desserts")
            .onAppear {
                viewModel.fetch()
            }
        }
    }
}

struct AllDessertsList_Previews: PreviewProvider {
    static var previews: some View {
        AllDessertsView()
    }
}
