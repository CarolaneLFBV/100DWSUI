//
//  HabitItem.swift
//  TrackHabit
//
//  Created by Carolane LEFEBVRE on 29/05/2023.
//

import SwiftUI

struct HabitItem: Codable, Identifiable, Equatable {
    var id = UUID()
    let name: String
    let description: String
    var habitCount: Int
    
    mutating func logHabit() {
        habitCount += 1
    }
}


class Habits: ObservableObject {
    @Published var habits = [HabitItem]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(habits) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Habits") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([HabitItem].self, from: items) {
                self.habits = decoded
                return
            }
        }
        self.habits = []
    }
    
    func updateHabitCount(habit: HabitItem) {
        guard let index = habits.firstIndex(where: {$0.id == habit.id}) else { return }
        habits[index].habitCount += 1
    }
    
    func addHabit(_ habit: HabitItem) {
        habits.append(habit)
    }
    
    
}


