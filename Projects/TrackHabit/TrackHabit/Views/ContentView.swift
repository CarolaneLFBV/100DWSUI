//
//  ContentView.swift
//  TrackHabit
//
//  Created by Carolane LEFEBVRE on 28/05/2023.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var habits = Habits()
    @State private var showSheet = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(habits.habits) { habit in
                    NavigationLink(destination: HabitView(habits: habits, currentHabit: habit)) {
                        HabitCard(habit: habit)
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Track Habit")
            .toolbar {
                Button("Add") {
                    showSheet.toggle()
                }
            }
            .sheet(isPresented: $showSheet) {
                NewHabitView(habits: self.habits)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        self.habits.habits.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
