//
//  DataController.swift
//  TrackYourHabits
//
//  Created by Carolane LEFEBVRE on 31/01/2023.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "TYHModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error load Data Core: \(error.localizedDescription)")
                return
            }
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
