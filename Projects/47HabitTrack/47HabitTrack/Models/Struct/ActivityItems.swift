//
//  Activity.swift
//  47HabitTrack
//
//  Created by Carolane LEFEBVRE on 16/12/2022.
//

import Foundation
import SwiftUI

struct Activity: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let category: Category
    var isDone: Bool
    
    init(name: String, description: String, category: Category, isDone: Bool) {
        self.name = name
        self.description = description
        self.category = category
        self.isDone = isDone
    }
}

extension Activity {
    static var allActivities: [Activity] = [
        Activity(name: "Do laundry", description: "I should make laundry every days", category: Category(name: "Lifestyle", image: Image("lifestyle")), isDone: false),
        
        Activity(name: "English", description: "I should train more english", category: Category(name: "Education", image: Image("education")), isDone: false),
    ]
}
