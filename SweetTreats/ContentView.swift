//
//  ContentView.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/6/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeFeedView(viewModel: DessertViewModel(networkService: NetworkService()), dessertDetails: DetailsViewModel(networkService: NetworkService()))
    }
}

#Preview {
    ContentView()
}
