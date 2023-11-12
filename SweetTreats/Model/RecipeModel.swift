//
//  Recipe.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/7/23.
//

import SwiftUI

struct Response: Codable {
    let meals: [Recipe]
}

struct Recipe: Hashable, Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}
