//
//  ViewModel.swift
//  MeetingList77
//
//  Created by Carolane LEFEBVRE on 04/03/2023.
//

import Foundation

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published private(set) var users: [User]
        @Published var selectedUser: User?
        let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedUsers")
        
        // Init
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                users = try JSONDecoder().decode([User].self, from: data)
            } catch {
                users = []
            }
        }
        
        // Add User
        func addUser() {
            let newUser = User(id: UUID(), name: "New Name", desc: "", phoneNumber: "", email: "", address: "")
            users.append(newUser)
        }
        
        // Update User
        func update(user: User) {
            guard let selectedUser = selectedUser else { return }
            if let index = users.firstIndex(of:selectedUser) {
                users[index] = user
            }
        }
        
        // Save User
        func save() {
            do {
                let data = try JSONEncoder().encode(users)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data")
            }
        }
        
        func delete(at offsets: IndexSet) {
            users.remove(atOffsets: offsets)
        }
    }
}
