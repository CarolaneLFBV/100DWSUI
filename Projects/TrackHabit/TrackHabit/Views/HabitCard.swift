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
        }
        .padding()
    }

}

struct HabitCard_Previews: PreviewProvider {
    static var previews: some View {
        HabitCard(habit: HabitItem(name: "Name", description: "Description", habitCount: 0))
    }
}
