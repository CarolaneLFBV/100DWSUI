//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Carolane LEFEBVRE on 28/01/2023.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
