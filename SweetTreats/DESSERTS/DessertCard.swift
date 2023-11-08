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
        HStack(alignment: .top) {
            URLImage(urlString: dessert.strMealThumb, width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            Text(dessert.strMeal)
                .bold()
                .font(.system(size: 18))
                .padding(5)
            }
            .padding(5)
        }
    }
