//
//  Dessert.swift
//  SweetTreats
//
//  Created by Chris Quagliani on 11/6/23.
//

import Foundation

struct Dessert: Identifiable {
    var id: UUID
    
    var title: String
    var instructions: String
    var ingredients: [String]
    var measurements: [String]
    
    init(id: UUID = UUID(), title: String, instructions: String, ingredients: [String], measurements: [String]) {
        self.id = id
        self.title = title
        self.instructions = instructions
        self.ingredients = ingredients
        self.measurements = measurements
    }
}

extension Dessert {
    static var sampleData: [Dessert] {
        [
            Dessert(title: "Choc Chip Pecan Pie", instructions: "First, make the pastry. Tip the ingredients into a food processor with 1 /4 tsp salt.", ingredients: ["Plain Flour", "Butter", "Cream Cheese", "Icing Sugar"], measurements: ["300g", "75g", "100g", "1 tbls"]),
            Dessert(title: "Pancakes", instructions: "Drizzle 2-3 tsp cold water into the funnel while the blade is running – the mixture should start to clump together. ", ingredients: ["Plain Flour", "Butter", "Cream Cheese", "Icing Sugar"], measurements: ["300g", "75g", "100g", "1 tbls"]),
            Dessert(title: "Waffles", instructions: "Trim the pastry so it’s flush with the top of the tin – a small serrated knife is best for this. ", ingredients: ["Plain Flour", "Butter", "Cream Cheese", "Icing Sugar"], measurements: ["300g", "75g", "100g", "1 tbls"])
        ]
    }
}
