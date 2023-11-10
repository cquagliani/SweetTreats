//
//  DessertViewModel.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/8/23.
//

import SwiftUI

//class DessertViewModel: ObservableObject {
//    @Published var Desserts: [Dessert] = []
//    
//    func fetch() {
//        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
//            return
//        }
//        
//        let task = URLSession.shared.dataTask(with: url) { [weak self] data,
//            _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//            
//            // Convert to JSON
//            do {
//                let response = try JSONDecoder().decode(Response.self, from: data)
//                DispatchQueue.main.async {
//                    self?.Desserts = response.meals
//                }
//            }
//            catch {
//                print(error)
//            }
//        }
//        
//        task.resume()
//    }
//}

import SwiftUI

class DessertViewModel: ObservableObject {
    @Published var desserts: [Dessert] = []
    
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetch() {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            return
        }
        
        networkService.fetchData(from: url) { [weak self] data, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let response = try JSONDecoder().decode(Response.self, from: data)
                DispatchQueue.main.async {
                    self?.desserts = response.meals
                }
            }
            catch {
                print(error)
            }
        }
    }
}

