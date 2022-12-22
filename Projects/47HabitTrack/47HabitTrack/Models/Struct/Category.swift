//
//  Category.swift
//  47HabitTrack
//
//  Created by Carolane LEFEBVRE on 20/12/2022.
//

import Foundation
import SwiftUI

struct Category: Identifiable {
    let id = UUID()
    let name: String
    let image: Image?
    
    init(name: String, image: Image?) {
        self.name = name
        self.image = image
    }
}

extension Category {
    static var allCategories: [Category] = [
        Category(name: "Sport", image: Image("sport")),
        Category(name: "Education", image: Image("education")),
        Category(name: "Lifestyle", image: Image("lifestyle")),
        Category(name: "Wealth", image: Image("wealth")),
        Category(name: "Health", image: Image("health")),
    ]
}


