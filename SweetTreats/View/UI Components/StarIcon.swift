//
//  StarIcon.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/11/23.
//

import SwiftUI

struct StarIcon: View {
    @State private var isStarFilled = false
    
    var body: some View {
        Button(action: {
            isStarFilled.toggle()
        }) {
            Image(systemName: isStarFilled ? "star.fill" : "star")
                .foregroundColor(isStarFilled ? .yellow : .blue)
                .font(.title)
                .imageScale(.small)
        }
    }
}

#Preview {
    StarIcon()
}
