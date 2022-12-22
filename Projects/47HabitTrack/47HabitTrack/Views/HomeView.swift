    //
    //  HomeView.swift
    //  47HabitTrack
    //
    //  Created by Carolane LEFEBVRE on 20/12/2022.
    //

import SwiftUI

struct HomeView: View {
    @State var activities: [Activity]
    
    func removeItems(at offsets: IndexSet) {
        activities.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 200))], spacing: 10) {
                    ForEach(activities) { activity in
                        NavigationLink(destination: ActivityView(activity: activity)){
                            ActivityCard(activity: activity)
                        }
                    }
                }
            }
        }
        .onAppear(perform: {
            for i in 0..<activities.count {
                activities[i].isDone = UserDefaults.standard.bool(forKey: "\(activities[i].name)isDone")
              }
        })
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(activities: Activity.allActivities)
    }
}
