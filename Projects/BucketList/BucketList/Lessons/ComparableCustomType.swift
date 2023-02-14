//
//  ComparableCustomType.swift
//  BucketList
//
//  Created by Carolane LEFEBVRE on 06/02/2023.
//

import SwiftUI

struct User: Identifiable, Comparable {
    let id = UUID()
    var firstName: String
    var lastName: String

    static func < (lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
    
}

struct ComparableCustomType: View {
    let users = [
        User(firstName: "Arnold", lastName: "Rimmer"),
        User(firstName: "Kristine", lastName: "Kochanski"),
        User(firstName: "David", lastName: "Lister"),
    ].sorted()

    var body: some View {
        List(users) { user in
            Text("\(user.lastName), \(user.firstName)")
        }
    }
}

struct ComparableCustomType_Previews: PreviewProvider {
    static var previews: some View {
        ComparableCustomType()
    }
}
