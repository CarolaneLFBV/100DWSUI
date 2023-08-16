//
//  ViewModel-ContentView.swift
//  MilestoneSeventySeven
//
//  Created by Carolane LEFEBVRE on 12/08/2023.
//

import UIKit
import Foundation

@MainActor class ViewModel: ObservableObject {
    @Published private(set) var users: [User]
    @Published var selectedUser: User?
    @Published var isUnlocked = false
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedUsers")
        
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            users = try JSONDecoder().decode([User].self, from: data)
        } catch {
            users = []
        }
    }
    
    func addUser(name: String, description: String, inputImage: UIImage?) {
        guard let imageData = inputImage?.jpegData(compressionQuality: 0.8) else { return }
        let newUser = User(id: UUID(), name: name, description: description, avatar: imageData)
        users.append(newUser)
        saveUser()
        print("User Added")
    }
    
    func updateUser() {
        self.objectWillChange.send()
        print("Updated")
    }
    
    func saveUser() {
        do {
            let data = try JSONEncoder().encode(users)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
    
    func removeUser(at offsets: IndexSet) {
        users.remove(atOffsets: offsets)
        saveUser()
        print("Deleted")
    }
    
    func authenticate() {
        let locationFetcher = LocationFetcher()
        isUnlocked = true
        locationFetcher.start()
    }
}

