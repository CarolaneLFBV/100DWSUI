//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Carolane LEFEBVRE on 30/07/2023.
//

import SwiftUI

@main
struct BookwormApp: App {
    // Load core data every time the app is opened
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
