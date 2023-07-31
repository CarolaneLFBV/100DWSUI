//
//  DataController.swift
//  Bookworm
//
//  Created by Carolane LEFEBVRE on 31/07/2023.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    
    // Tells Core Data we want to use the Bookworm data model.
    // /!\ It doesn't load it, but prepares to load it.
    let container = NSPersistentContainer(name: "Bookworm")
    
    // Initializer that loads stored data immediately,gets error if it doesn't load properly.
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
