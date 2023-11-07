//
//  AllDessertsList.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/6/23.
//

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

struct AllDessertsList: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.Desserts, id: \.self) {dessert in
                NavigationLink(dessert.strMeal, destination: DessertDetailView(DessertDetailView: dessert))
            }
            .navigationTitle("All Desserts")
            .onAppear {
                viewModel.fetch()
            }
        }
    }
}

struct AllDessertsList_Previews: PreviewProvider {
    static var previews: some View {
        AllDessertsList()
    }
}
