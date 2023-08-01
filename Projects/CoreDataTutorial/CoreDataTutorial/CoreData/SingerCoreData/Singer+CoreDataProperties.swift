//
//  Singer+CoreDataProperties.swift
//  CoreDataTutorial
//
//  Created by Carolane LEFEBVRE on 01/08/2023.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    
    public var wrappedFirstName: String {
        firstName ?? "Unknown"
    }
    
    public var wrappedLastName: String {
        lastName ?? "Unknown"
    }

}

extension Singer : Identifiable {

}
