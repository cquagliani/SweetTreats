//
//  DessertFeed.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/6/23.
//

import SwiftUI

struct DessertFeed: View {
    let desserts: [Dessert]
    var body: some View {
        List(desserts) { dessert in
            DessertCard(dessert: dessert)
        }
    }
}

struct DessertFeed_Previews: PreviewProvider {
    static var previews: some View {
        DessertFeed(desserts: Dessert.sampleData)
    }
}
