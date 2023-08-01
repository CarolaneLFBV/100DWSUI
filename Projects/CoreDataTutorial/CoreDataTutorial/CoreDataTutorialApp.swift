//
//  CoreDataTutorialApp.swift
//  CoreDataTutorial
//
//  Created by Carolane LEFEBVRE on 01/08/2023.
//

import SwiftUI

@main
struct CoreDataTutorialApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            DynamicallyFilteringFR()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
