//
//  ContentView.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/6/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        HomeFeedView(viewModel: RecipeViewModel(networkService: NetworkService()), recipeDetails: DetailsViewModel(networkService: NetworkService()))
    }
}

#Preview {
    ContentView()
}
