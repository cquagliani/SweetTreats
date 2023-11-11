//
//  DessertViewModel.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/8/23.
//

import SwiftUI

class DessertViewModel: ObservableObject {
    @Published var desserts: [Dessert] = []
    var error: Error?

    private let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    func fetch() {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            return
        }

        networkService.fetchData(from: url) { [weak self] data, responseError in
            DispatchQueue.main.async {
                if let error = responseError {
                    self?.error = error
                } else if let data = data {
                    do {
                        let response = try JSONDecoder().decode(Response.self, from: data)
                        self?.desserts = response.meals
                    } catch {
                        self?.error = error
                    }
                }
            }
        }
    }
}
