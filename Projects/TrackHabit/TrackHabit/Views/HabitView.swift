//
//  HabitView.swift
//  TrackHabit
//
//  Created by Carolane LEFEBVRE on 29/05/2023.
//

import SwiftUI

struct HabitView: View {
    @State var habit: HabitItem
    var body: some View {
        VStack {
            Text(habit.name)
                .font(.title)
                .bold()
            Text(habit.description)
            
            Button {
                addToDone()
            } label: {
                Text(habit.isDone == true ? "Undone" : "Done")
            }
        }
    }

    func addToDone() {
        habit.isDone.toggle()
        UserDefaults.standard.set(habit.isDone, forKey: "\(habit.name)isDone")
    }
}

struct HabitView_Previews: PreviewProvider {
    static var previews: some View {
        HabitView(habit: HabitItem(name: "Name", description: "This is a description of a habit", isDone: false))
    }
}
