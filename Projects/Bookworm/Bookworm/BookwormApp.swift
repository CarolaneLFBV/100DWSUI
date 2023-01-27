//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Carolane LEFEBVRE on 27/01/2023.
//

import SwiftUI

@main
struct BookwormApp: App {
    @StateObject private var dataController = DataController ()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment (\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
