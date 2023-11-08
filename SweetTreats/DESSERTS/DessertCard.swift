//
//  DessertCard.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/6/23.
//

import SwiftUI

struct DessertCard: View {
    let dessert: Dessert
    
    var body: some View {
        ZStack {
            URLImage(urlString: dessert.strMealThumb, width: 350, height: 100)
                .cornerRadius(25)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .clipped()
            
            // Dark overlay to improve title readability
            Rectangle()
                .frame(width: 350, height: 100)
                .foregroundColor(.black)
                .opacity(0.3)
                .cornerRadius(25)
                .shadow(radius: 10)
            
            HStack {
                Text(dessert.strMeal)
                    .font(
                        .title2
                        .bold()
                    )
                    .foregroundColor(.white)
                    .padding(.leading)
                Spacer() // Aligns text to the left
            }
        }
        .cornerRadius(25) // Must match the image's corner radius
    }
}
