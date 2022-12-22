    //
    //  ActivityView.swift
    //  47HabitTrack
    //
    //  Created by Carolane LEFEBVRE on 20/12/2022.
    //

import SwiftUI

struct ActivityView: View {
    @State var activity : Activity

    var body: some View {
        NavigationStack {
            VStack {
                Text(activity.description)
                
                Image(systemName: activity.isDone ? "checkmark.square.fill" : "square")
                    .font(.system(size: 25))
                    .foregroundColor(activity.isDone ? Color("EtonBlue") : Color("EtonBlue"))
                
            }
            .navigationTitle(activity.name)
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(activity: Activity.allActivities[0])
    }
}
