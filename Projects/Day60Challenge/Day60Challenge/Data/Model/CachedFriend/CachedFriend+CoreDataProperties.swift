//
//  CachedFriend+CoreDataProperties.swift
//  Day60Challenge
//
//  Created by Carolane LEFEBVRE on 29/01/2023.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var user: CachedUser?
    
    var wrappedName: String {
        name ?? "Unknown"
    }

}

extension CachedFriend : Identifiable {

}
