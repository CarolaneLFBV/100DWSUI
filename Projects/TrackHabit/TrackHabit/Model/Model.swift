//
//  HabitItem.swift
//  TrackHabit
//
//  Created by Carolane LEFEBVRE on 29/05/2023.
//

import SwiftUI

protocol Encodable: Identifiable, Codable {
    var id: UUID { get }
}

struct HabitItem: Codable, Identifiable {

    var id = UUID()
    let name: String
    let description: String
    var isDone: Bool
    
    init(id: UUID = UUID(), name: String, description: String, isDone: Bool) {
        self.id = id
        self.name = name
        self.description = description
        self.isDone = isDone
    }
}


class Habits: ObservableObject {
    @Published var items = [HabitItem]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([HabitItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        self.items = []
    }
    
    
}


