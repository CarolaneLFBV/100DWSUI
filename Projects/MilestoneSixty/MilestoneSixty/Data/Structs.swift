//
//  Structs.swift
//  MilestoneSixty
//
//  Created by Carolane LEFEBVRE on 02/08/2023.
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
    var registered: String
    var tags: [String]
    var friends: [Friend]
    }

struct Friend: Identifiable, Codable {
    let id = UUID()
    var name: String
}
