//
//  Category.swift
//  TrackYourHabits
//
//  Created by Carolane LEFEBVRE on 31/01/2023.
//

import Foundation

struct Category: Identifiable, Hashable {
    let id = UUID()
    var name: String
}

extension Category {
    static var allCategories: [Category] = [
        Category(name: "Sport"),
        Category(name: "Lifestyle"),
        Category(name: "Wealth"),
        Category(name: "Health"),
        Category(name: "Kitchen"),
        Category(name: "Learning"),
    ]
}
