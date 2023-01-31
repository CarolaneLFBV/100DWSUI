//
//  ActivityCard.swift
//  TrackYourHabits
//
//  Created by Carolane LEFEBVRE on 31/01/2023.
//

import SwiftUI

struct ActivityCard: View {
    let activity: CachedActivity
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: CachedActivity.entity(), sortDescriptors: []) var cachedActivities: FetchedResults<CachedActivity>
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(activity.wrappedNameActivity)
                .font(.title3)
                .bold()
            
            Text(activity.wrappedAboutActivity)
                .font(.subheadline)
        }
        .foregroundColor(activity.isDone ? Color(.systemGreen) : Color(.systemRed))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

