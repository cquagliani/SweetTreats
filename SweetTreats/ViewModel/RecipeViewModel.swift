//
//  RecipeViewModel.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/8/23.
//

import SwiftUI

class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    var error: Error?

    private let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    func fetch(strCategory: String) {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(strCategory)") else {
            return
        }

        networkService.fetchData(from: url) { [weak self] data, responseError in
            DispatchQueue.main.async {
                if let error = responseError {
                    self?.error = error
                } else if let data = data {
                    do {
                        let response = try JSONDecoder().decode(Response.self, from: data)
                        self?.recipes = response.meals
                    } catch {
                        self?.error = error
                    }
                }
            }
        }
    }
}
