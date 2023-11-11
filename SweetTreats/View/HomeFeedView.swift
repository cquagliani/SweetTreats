//
//  HomeFeedView.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/10/23.
//

import SwiftUI

struct HomeFeedView: View {
    @StateObject var viewModel: DessertViewModel
    @ObservedObject var dessertDetails: DetailsViewModel

    var body: some View {
        NavigationStack {
            AllCategoriesChipsView()
                .padding(.top, 15)

            List(viewModel.desserts, id: \.idMeal) { dessert in
                NavigationLink(destination: DessertDetailView(originalDessert: dessert, dessertDetails: dessertDetails)) {
                    DessertCardView(dessert: dessert)
                }
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                .padding(.bottom, -10)
            }
            .listStyle(.plain)
            .navigationTitle("All Desserts")
            .onAppear {
                viewModel.fetch()
            }
        }
    }
}

struct HomeFeedView_Previews: PreviewProvider {
    static var previews: some View {
        HomeFeedView(
            viewModel: DessertViewModel(networkService: NetworkService()),
            dessertDetails: DetailsViewModel(networkService: NetworkService())
        )
    }
}
