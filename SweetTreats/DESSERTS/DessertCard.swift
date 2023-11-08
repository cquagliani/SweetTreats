//
//  DessertCard.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/6/23.
//

import SwiftUI

struct DessertCard: View {
    let dessert: Dessert
    let corner = 10.0 // Controls corner radius of all elements in the ZStack
    let shadow = 10.0 // Controls shadow radius of all elements in the ZStack
    
    var body: some View {
        ZStack {
            URLImage(urlString: dessert.strMealThumb, width: 350, height: 100)
                .cornerRadius(corner)
                .shadow(radius: shadow)
                .clipped()
            
            // Dark overlay to improve title readability
            Rectangle()
                .frame(width: 350, height: 100)
                .foregroundColor(.black)
                .opacity(0.3)
                .cornerRadius(corner)
                .shadow(radius: shadow)
            
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
        .cornerRadius(corner)
    }
}
