//
//  DessertCard.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/6/23.
//

import SwiftUI

struct DessertCardView: View {
    let dessert: Dessert
    let corner = 10.0 // Controls corner radius of all elements in the ZStack
    let shadow = 10.0 // Controls shadow radius of all elements in the ZStack
    
    var body: some View {
        ZStack {
            URLImage(urlString: dessert.strMealThumb, width: 350, height: 125)
                .cornerRadius(corner)
                .shadow(radius: shadow)
                .clipped()
            
            // Dark overlay to improve title readability
            Rectangle()
                .frame(width: 350, height: 125)
                .foregroundColor(.black)
                .opacity(0.35)
                .cornerRadius(corner)
                .shadow(radius: shadow)
            
            HStack {
                Text(dessert.strMeal.capitalized)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .cornerRadius(corner)
    }
}
