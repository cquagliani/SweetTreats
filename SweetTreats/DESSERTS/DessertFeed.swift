//
//  DessertFeed.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/6/23.
//

import SwiftUI

struct Response: Codable {
    let meals: [DessertPreview]
}

struct DessertPreview: Hashable, Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}

class ViewModel: ObservableObject {
    @Published var dessertPreviews: [DessertPreview] = []
    
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
                    self?.dessertPreviews = response.meals
                }
            }
            catch {
                print(error)
            }
        }
        
        task.resume()
    }
}

struct DessertFeed: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dessertPreviews, id: \.self) { dessertPreview in
                    HStack {
                        Image("")
                            .frame(width: 100, height: 70)
                            .background(Color.gray)
                        Text(dessertPreview.strMeal)
                            .bold()
                    }
                    .padding(5)
                }
            }
            .navigationTitle("All Desserts")
            .onAppear {
                viewModel.fetch()
            }
        }
    }
}

struct DessertFeed_Previews: PreviewProvider {
    static var previews: some View {
        DessertFeed()
    }
}
