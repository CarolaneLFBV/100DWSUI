//
//  User.swift
//  MilestoneSeventySeven
//
//  Created by Carolane LEFEBVRE on 12/08/2023.
//

import SwiftUI

struct User: Identifiable, Comparable, Codable {
    var id: UUID
    var name: String
    var description: String
    var avatar: Data
    
    init(id: UUID, name: String, description: String, avatar: Data) {
        self.id = UUID()
        self.name = name
        self.description = description
        self.avatar = avatar
    }
    
    func convertDataToImg() -> Image {
        let uiImage = avatar
        if let uiImage = UIImage(data: uiImage) {
            return Image(uiImage: uiImage)
        }
        return Image(systemName: "questionmark.square.dashed")
    }
    
    static func <(lhs: User, rhs: User) -> Bool {
        rhs.name < lhs.name
    }
    
    // Examples
    static let exampleAvatar = UIImage(named: "Paul_Hudson")!.jpegData(compressionQuality: 0.8)
    static let example = User(id: UUID(), name: "Paul Hudson", description: "Creator of the tutorials Hacking With Swift", avatar: exampleAvatar!)
}
