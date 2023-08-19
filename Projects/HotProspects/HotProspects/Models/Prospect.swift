//
//  Prospect.swift
//  HotProspects
//
//  Created by Carolane LEFEBVRE on 17/08/2023.
//

import Foundation

// Class allows us to change instances of the class directly and have it be updated in all other views at the same time.
class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false
}

@MainActor class Prospects: ObservableObject {
    @Published var people: [Prospect]
    let saveKey = "SavedData"
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedData")
    
    /* Saving with UserDefaults
     init() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
                people = decoded
                return
            }
        }
        people = []
    }
     */
    
    // Saving with JSON and documents directory
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            people = try JSONDecoder().decode([Prospect].self, from: data)
        } catch {
            people = []
        }
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
    
    /*
     private func save() {
        if let encoded = try? JSONEncoder().encode(people) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
     */
    
    private func save() {
        do {
            let data = try JSONEncoder().encode(people)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
    
    func add(prospect: Prospect) {
        people.append(prospect)
        save()
    }
}
