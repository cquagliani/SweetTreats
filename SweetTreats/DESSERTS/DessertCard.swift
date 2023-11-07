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
        HStack(alignment: .firstTextBaseline) {
            Text(dessert.title)
                .font(.system(size: 18))
                .accessibilityAddTraits(.isHeader)
            Spacer()
            Label("\(dessert.ingredients.count)", systemImage: "list.bullet")
                .font(.system(size: 14))
        }
        .frame(height: 100)
        .padding()
    }
}

struct DessertCard_Previews: PreviewProvider {
    static var dessert = Dessert.sampleData[0]
    static var previews: some View {
        DessertCard(dessert: dessert)
    }
}
