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
                ForEach(habits.items) { item in
                    NavigationLink(destination: HabitView(habit: item)) {
                        HabitCard(habit: item)
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
            .onAppear {
                for i in 0..<habits.items.count {
                    habits[i].isDone = UserDefaults.standard.bool(forKey: "\(habits[i].name)isDone")
                }
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        self.habits.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
