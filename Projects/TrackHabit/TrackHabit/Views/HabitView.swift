//
//  HabitView.swift
//  TrackHabit
//
//  Created by Carolane LEFEBVRE on 29/05/2023.
//

import SwiftUI

struct HabitView: View {
    @ObservedObject var habits: Habits
    @State var currentHabit: HabitItem
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("Description: \(currentHabit.description)")
                    Text("Habit count: \(currentHabit.habitCount)")
                }
                
                Section {
                    Button("Log Habit") {
                        self.currentHabit.habitCount += 1
                        self.habits.updateHabitCount(habit: currentHabit)
                    }
                }
            }
            .navigationTitle(Text(currentHabit.name))
        }
    }
}

struct HabitView_Previews: PreviewProvider {
    static var previews: some View {
        HabitView(habits: Habits(),  currentHabit: HabitItem(name: "Test", description: "Description", habitCount: 0))
    }
}
