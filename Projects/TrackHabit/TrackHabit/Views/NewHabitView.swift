//
//  NewHabitView.swift
//  TrackHabit
//
//  Created by Carolane LEFEBVRE on 29/05/2023.
//

import SwiftUI

struct NewHabitView: View {
    @ObservedObject var habits: Habits
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var description = ""
    @State private var number = 0
    
    @State private var isPresented = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Habit informations") {
                    TextField("Name", text: $name)
                    TextField("Description", text: $description)
                }
                Button("Save") {
                    let habit = HabitItem(name: self.name, description: self.description, habitCount: 0)
                    self.habits.addHabit(habit)
                    
                    isPresented = true
                    alertTitle = "Success"
                    alertMessage = "Your habit has been created!"
                }
            }
            .navigationTitle("New Habit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "multiply")
                }
            }
            .alert(alertTitle, isPresented: $isPresented) {
                Button("OK") {
                    dismiss()
                }
            } message: {
                Text(alertMessage)
            }
        }
    }
}

struct NewHabitView_Previews: PreviewProvider {
    static var previews: some View {
        NewHabitView(habits: Habits())
    }
}
