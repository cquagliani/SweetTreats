//
//  DetailsViewModel.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/8/23.
//

import SwiftUI

class DetailsViewModel: ObservableObject {
    @Published var dessertDetails: [DessertDetail] = []
    
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetch(idMeal: String) {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(idMeal)") else {
            return
        }
        
        networkService.fetchData(from: url) { [weak self] data, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let response = try JSONDecoder().decode(DetailResponse.self, from: data)
                DispatchQueue.main.async {
                    self?.dessertDetails = response.meals
                }
            }
            catch {
                print(error)
            }
        }
    }
}

