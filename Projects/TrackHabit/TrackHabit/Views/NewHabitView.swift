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
                    TextField("Name*", text: $name)
                    TextField("Description", text: $description)
                }
                Button("Save") {
                    createNewItem()
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
                Button("OK", role: .none) { }
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    func createNewItem() {
        guard (self.name != "") else {
            alertTitle = "Error"
            alertMessage = "Your habit's name cannot be empty."
            isPresented = true
            return
        }
        
        guard (self.description != "") else {
            alertTitle = "Error"
            alertMessage = "Your habit's description cannot be empty."
            isPresented = true
            return
        }
    
        let habit = HabitItem(name: name, description: description, isDone: false)
        habits.items.append(habit)
        
        isPresented = true
        alertTitle = "Success"
        alertMessage = "Your habit has been created!"
        
    }
}

struct NewHabitView_Previews: PreviewProvider {
    static var previews: some View {
        NewHabitView(habits: Habits())
    }
}
