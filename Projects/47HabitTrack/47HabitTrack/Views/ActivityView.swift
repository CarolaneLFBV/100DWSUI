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
                Form{
                    HStack{
                        Text("Title:")
                            .bold()
                        
                        Spacer()
                        
                        Text(activity.name)
                    }
                    
                    HStack{
                        Text("Description:")
                            .bold()
                        
                        Spacer()
                        
                        Text(activity.description)
                    }
                    
                    HStack {
                        Text("Task done:")
                            .bold()
                        
                        Spacer()
                        
                        Image(systemName: activity.isDone ? "checkmark.square.fill" : "square")
                            .font(.system(size: 25))
                            .foregroundColor(activity.isDone ? Color("EtonBlue") : Color("EtonBlue"))
                    }
                }
                .navigationTitle("Activity: \(activity.name)")
            }
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(activity: Activity.allActivities[0])
    }
}
