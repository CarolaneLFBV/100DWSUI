//
//  DataController.swift
//  CoreDataTutorial
//
//  Created by Carolane LEFEBVRE on 01/08/2023.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    
    // "": add core data model's name
    let container = NSPersistentContainer(name: "CoreDataProject")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
            
            // Merge duplicated objects based on their properties
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
