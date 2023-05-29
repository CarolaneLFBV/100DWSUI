//
//  HabitCard.swift
//  TrackHabit
//
//  Created by Carolane LEFEBVRE on 29/05/2023.
//

import SwiftUI

struct HabitCard: View {
    @State var habit: HabitItem
    @State private var isDone = false
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(habit.name)
                    .bold()
                Text(habit.description)
            }
            .foregroundColor(isDone == true ? .gray : .black)
            
            Spacer()
            
            Image(systemName: UserDefaults.standard.bool(forKey: "\(habit.name)isDone") == true ? "checkmark.square.fill" : "square")
                .foregroundColor(.blue)
        }
        .padding()
    }

}

struct HabitCard_Previews: PreviewProvider {
    static var previews: some View {
        HabitCard(habit: HabitItem(name: "Name", description: "Description", isDone: false))
    }
}
