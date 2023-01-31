//
//  CachedActivity+CoreDataProperties.swift
//  TrackYourHabits
//
//  Created by Carolane LEFEBVRE on 31/01/2023.
//
//

import Foundation
import CoreData


extension CachedActivity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedActivity> {
        return NSFetchRequest<CachedActivity>(entityName: "CachedActivity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var aboutActivity: String?
    @NSManaged public var isDone: Bool
    @NSManaged public var category: NSSet?
    
    var wrappedNameActivity: String {
        name ?? "Unknown Activity Name"
    }
    
    var wrappedAboutActivity: String {
        aboutActivity ?? "Unknown description"
    }
    
    public var categoriesArray: [CachedCategory] {
        let set = category as? Set<CachedCategory> ?? []
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }

}

// MARK: Generated accessors for category
extension CachedActivity {

    @objc(addCategoryObject:)
    @NSManaged public func addToCategory(_ value: CachedCategory)

    @objc(removeCategoryObject:)
    @NSManaged public func removeFromCategory(_ value: CachedCategory)

    @objc(addCategory:)
    @NSManaged public func addToCategory(_ values: NSSet)

    @objc(removeCategory:)
    @NSManaged public func removeFromCategory(_ values: NSSet)

}

extension CachedActivity : Identifiable {

}
