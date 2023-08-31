//
//  ViewModel-DicesView.swift
//  MilestoneNinetyFive
//
//  Created by Carolane Lefebvre on 31/08/2023.
//

import Foundation

@MainActor class ViewModel: ObservableObject {
    @Published private(set) var dices: [Dice]
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedData")
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            dices = try JSONDecoder().decode([Dice].self, from: data)
        } catch {
            dices = []
        }
    }
    
    func saveDice() {
        do {
            let data = try JSONEncoder().encode(dices)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
    
    func addDice(name: String, side: Int, result: Int) {
        let newDice = Dice(name: name, result: result, side: side)
        dices.append(newDice)
        saveDice()
        print("Dice added")
    }
    
    func updateDice() {
        self.objectWillChange.send()
        print("Updated")
    }
    
    func removeDice(at offsets: IndexSet) {
        dices.remove(atOffsets: offsets)
        saveDice()
        print("Dice deleted")
    }
}
