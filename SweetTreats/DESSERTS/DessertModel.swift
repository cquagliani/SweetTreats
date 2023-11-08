//
//  Dessert.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/7/23.
//

import Foundation
import SwiftUI

struct URLImage: View {
    let urlString: String
    
    @State var data: Data?
    
    var body: some View {
        if let data = data, let previewImage = UIImage(data: data) {
            Image(uiImage: previewImage)
                .resizable()
                .scaledToFill()
                .aspectRatio(contentMode: .fill)
                .frame(width: 500, height: 300)
        } else {
            // If no image exists, display a placeholder system image
            Image(systemName: "photo.artframe")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 70)
                .onAppear {
                    fetchImages()
                }
        }
    }
    
    private func fetchImages() {
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
        }
        
        task.resume()
    }
}

class ViewModel: ObservableObject {
    @Published var Desserts: [Dessert] = []
    
    func fetch() {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data,
            _, error in
            guard let data = data, error == nil else {
                return
            }
            
            // Convert to JSON
            do {
                let response = try JSONDecoder().decode(Response.self, from: data)
                DispatchQueue.main.async {
                    self?.Desserts = response.meals
                }
            }
            catch {
                print(error)
            }
        }
        
        task.resume()
    }
}

struct Response: Codable {
    let meals: [Dessert]
}

struct Dessert: Hashable, Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}

class Details: ObservableObject {
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

struct DetailResponse: Codable {
    let meals: [DessertDetail]
}

struct DessertDetail: Hashable, Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
    let strInstructions: String
    let strIngredient1: String
    let strIngredient2: String
    let strIngredient3: String
    let strIngredient4: String
    let strIngredient5: String
    let strIngredient6: String
    let strIngredient7: String
    let strIngredient8: String
    let strIngredient9: String
    let strIngredient10: String
    let strMeasure1: String
    let strMeasure2: String
    let strMeasure3: String
    let strMeasure4: String
    let strMeasure5: String
    let strMeasure6: String
    let strMeasure7: String
    let strMeasure8: String
    let strMeasure9: String
    let strMeasure10: String
}
