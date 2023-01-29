//
//  DataController.swift
//  Day60Challenge
//
//  Created by Carolane LEFEBVRE on 29/01/2023.
//

import Foundation

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "FriendFaceModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading Core Data: \(error.localizedDescription)")
                return
            }
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
