//
//  Friend.swift
//  Day60Challenge
//
//  Created by Carolane LEFEBVRE on 29/01/2023.
//

import Foundation

struct Friend: Identifiable, Codable, Hashable {
    let id = UUID()
    var name: String
}
