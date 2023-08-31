//
//  Dice.swift
//  MilestoneNinetyFive
//
//  Created by Carolane Lefebvre on 31/08/2023.
//

import Foundation

struct Dice: Identifiable, Codable {
    var id: UUID
    var name: String
    var result: Int
    var side: Int
    
    init(id: UUID = UUID(), name: String, result: Int, side: Int) {
        self.id = id
        self.name = name
        self.result = result
        self.side = side
    }
    
    static let example = Dice(name: "Dice1", result: 1, side: 10)
    
}
