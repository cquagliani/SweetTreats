//
//  Dessert.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/7/23.
//

import Foundation

struct Response: Codable {
    let meals: [Dessert]
}

struct Dessert: Hashable, Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}
