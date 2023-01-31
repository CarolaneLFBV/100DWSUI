//
//  CachedCategory+CoreDataProperties.swift
//  TrackYourHabits
//
//  Created by Carolane LEFEBVRE on 31/01/2023.
//
//

import Foundation
import CoreData


extension CachedCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedCategory> {
        return NSFetchRequest<CachedCategory>(entityName: "CachedCategory")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var activity: CachedActivity?
    
    var wrappedName: String {
        name ?? "Unknown Name Category"
    }

}

extension CachedCategory : Identifiable {

}
