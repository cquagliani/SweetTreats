//
//  AllDessertsList.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/6/23.
//

import SwiftUI

struct AllDessertsView: View {
    @StateObject var viewModel: DessertViewModel
    @ObservedObject var dessertDetails: DetailsViewModel

    
    var body: some View {
        NavigationStack {
            List(viewModel.desserts, id: \.idMeal) { dessert in
                NavigationLink(destination: DessertDetailView(originalDessert: dessert, dessertDetails: dessertDetails)) {
                    DessertCardView(dessert: dessert)
                }
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                .padding(.bottom, -10)
            }
            .padding(.top, 15)
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
        AllDessertsView(
            viewModel: DessertViewModel(networkService: NetworkService()),
            dessertDetails: DetailsViewModel(networkService: NetworkService())
        )
    }
}
