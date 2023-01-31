//
//  Activity.swift
//  TrackYourHabits
//
//  Created by Carolane LEFEBVRE on 31/01/2023.
//

import Foundation

struct Activity: Identifiable {
    let id = UUID()
    var name: String
    var aboutActivity: String
    var categories: [Category]
    var isDone: Bool
}

extension Activity {
    static var activityPH: Activity {
        Activity(name: "Activity Placeholder", aboutActivity: "This is a great activity", categories: [Category(name: "Sport"), Category(name: "Lifestyle")], isDone: false)
    }
}


