//
//  AllDessertsList.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/6/23.
//

import SwiftUI

struct AllDessertsList: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.Desserts, id: \.self) {dessert in
                NavigationLink(dessert.strMeal, destination: DessertDetailView(DessertDetailView: dessert))
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
        AllDessertsList()
    }
}
