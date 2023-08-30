//
//  Card.swift
//  Flashzilla
//
//  Created by Carolane Lefebvre on 22/08/2023.
//

import Foundation

struct Card: Codable {
    let prompt: String
    let answer: String
    
    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
