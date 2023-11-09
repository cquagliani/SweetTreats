//
//  ImageModel.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/8/23.
//

import SwiftUI

struct URLImage: View {
    let urlString: String
    let width: CGFloat
    let height: CGFloat
    @State var data: Data?
    
    var body: some View {
        if let data = data, let previewImage = UIImage(data: data) {
            Image(uiImage: previewImage)
                .resizable()
                .scaledToFill()
                .aspectRatio(contentMode: .fill)
                .frame(width: width, height: height, alignment: .leading)
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
