    //
    //  ContentView.swift
    //  TrackYourHabits
    //
    //  Created by Carolane LEFEBVRE on 31/01/2023.
    //

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var activities: [Activity] = []
    @State private var isShowing: Bool = false
    @State private var firstLoad: Bool = false
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: CachedActivity.entity(), sortDescriptors: []) var cachedActivities: FetchedResults<CachedActivity>
    
    func deleteActivity(at offsets: IndexSet) {
        for offset in offsets {
            let activity = cachedActivities[offset]
            moc.delete(activity)
        }
        try? moc.save()
    }
    
    func fetch() {
        let fetchRequest: NSFetchRequest<CachedActivity> = CachedActivity.fetchRequest()
        do {
            let activityData = try moc.fetch(fetchRequest)
            print(activityData)
        } catch {
            print("Unable to Fetch Workouts, (\(error))")
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(cachedActivities) { activity in
                    NavigationLink {
                        ActivityView(activity: activity)
                    } label: {
                        ActivityCard(activity: activity)
                    }
                }
                .onDelete(perform: deleteActivity)
            }
            .navigationTitle("Habits")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowing.toggle()
                    } label: {
                        Label("Add", systemImage: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $isShowing) {
                AddActivityView()
            }
            .task {
                await MainActor.run {
                    for activity in activities {
                        let newActivity = CachedActivity(context: moc)
                        newActivity.name = activity.name
                        newActivity.aboutActivity = activity.aboutActivity
                        newActivity.id = activity.id
                        newActivity.isDone = activity.isDone
                        
                        for category in activity.categories {
                            let newCategory = CachedCategory(context: moc)
                            newCategory.id = category.id
                            newCategory.name = category.name
                            newCategory.activity = newActivity
                        }
                        try? moc.save()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
