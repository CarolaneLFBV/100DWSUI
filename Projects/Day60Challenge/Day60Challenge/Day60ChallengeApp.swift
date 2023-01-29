//
//  Day60ChallengeApp.swift
//  Day60Challenge
//
//  Created by Carolane LEFEBVRE on 29/01/2023.
//

import SwiftUI

@main
struct Day60ChallengeApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
