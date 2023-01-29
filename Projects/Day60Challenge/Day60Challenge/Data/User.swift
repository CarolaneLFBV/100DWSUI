//
//  User.swift
//  Day60Challenge
//
//  Created by Carolane LEFEBVRE on 29/01/2023.
//

import Foundation

struct User: Identifiable, Codable {
    let id = UUID()
    var isActive: Bool
    var name: String
    var age: Int16
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
}

extension User {
    static var userPH = User(
        isActive: true,
        name: "John Doe",
        age: 23,
        company: "Apple",
        email: "john@doe.com",
        address: "123 Georgie Street",
        about: "My name is John Doe, and I am 23 years old. I love playing video games and coding!",
        registered: Date.now,
        tags: ["video-games", "coding", "apple"],
        friends: [Friend(name: "Catherine"), Friend(name: "Johnny")])
}
