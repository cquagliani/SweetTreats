//
//  DetailsViewModel.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/8/23.
//

import SwiftUI

class DetailsViewModel: ObservableObject {
    @Published var dessertDetails: [DessertDetail] = []
    
    func fetch(idMeal: String) {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(idMeal)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data,
            _, error in
            guard let data = data, error == nil else {
                return
            }
            
            // Convert to JSON
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
        
        task.resume()
    }
}
