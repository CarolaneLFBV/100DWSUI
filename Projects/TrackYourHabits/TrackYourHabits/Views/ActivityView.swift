    //
    //  ActivityView.swift
    //  TrackYourHabits
    //
    //  Created by Carolane LEFEBVRE on 31/01/2023.
    //

import SwiftUI

struct ActivityView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: CachedActivity.entity(), sortDescriptors: []) var cachedActivities: FetchedResults<CachedActivity>
    let activity: CachedActivity

    var body: some View {
        VStack(alignment: .leading) {
            Text(activity.wrappedNameActivity)
                .font(.title)

            Text(activity.wrappedAboutActivity)
                .font(.subheadline)
            
            Button {
                activity.isDone.toggle()
                try? moc.save()
            } label: {
                Label(activity.isDone ? "Done" : "Not Done", systemImage: activity.isDone ? "checkmark.square.fill" : "square")
            }
            .padding()
            .foregroundColor(.white)
            .background(Color(.systemBlue))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding()
    }
}
