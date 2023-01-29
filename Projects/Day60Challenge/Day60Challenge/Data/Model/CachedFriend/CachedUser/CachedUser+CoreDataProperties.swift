    //
    //  CachedUser+CoreDataProperties.swift
    //  Day60Challenge
    //
    //  Created by Carolane LEFEBVRE on 29/01/2023.
    //
    //

import Foundation
import CoreData


extension CachedUser {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }
    
    @NSManaged public var about: String?
    @NSManaged public var address: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var id: UUID?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var formattedDate: String?
    @NSManaged public var friend: NSSet?
    
    
    var wrappedName: String {
        name ?? "Unknown"
    }
    
    var wrappedCompany: String {
        company ?? "No job"
    }
    
    var wrappedAbout: String {
        about ?? "No data"
    }
    
    var wrappedAddress: String {
        address ?? "Homeless"
    }
    
    var wrappedEmail: String {
        email ?? "no email"
    }
    
    var wrappedFormattedDate: String {
        formattedDate ?? "N/A"
    }
    
    var wrappedID: UUID {
        id ?? UUID()
    }
    
    public var friendsArray: [CachedFriend] {
        let set = friend as? Set<CachedFriend> ?? []
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
    
}

    // MARK: Generated accessors for friend
extension CachedUser {
    
    @objc(addFriendObject:)
    @NSManaged public func addToFriend(_ value: CachedFriend)
    
    @objc(removeFriendObject:)
    @NSManaged public func removeFromFriend(_ value: CachedFriend)
    
    @objc(addFriend:)
    @NSManaged public func addToFriend(_ values: NSSet)
    
    @objc(removeFriend:)
    @NSManaged public func removeFromFriend(_ values: NSSet)
    
}

extension CachedUser : Identifiable {
    
}
