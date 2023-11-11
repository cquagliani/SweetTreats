//
//  DetailsViewModel.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/8/23.
//

import SwiftUI

class DetailsViewModel: ObservableObject {
    @Published var dessertDetails: [DessertDetail] = []
    var error: Error?

    private let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    func fetch(idMeal: String) {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(idMeal)") else {
            return
        }

        networkService.fetchData(from: url) { [weak self] data, responseError in
            DispatchQueue.main.async {
                if let error = responseError {
                    self?.error = error
                } else if let data = data {
                    do {
                        let response = try JSONDecoder().decode(DetailResponse.self, from: data)
                        self?.dessertDetails = response.meals
                    } catch {
                        self?.error = error
                    }
                }
            }
        }
    }
}
