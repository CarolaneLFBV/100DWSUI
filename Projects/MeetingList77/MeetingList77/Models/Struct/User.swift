//
//  User.swift
//  MeetingList77
//
//  Created by Carolane LEFEBVRE on 03/03/2023.
//

import SwiftUI

struct User: Identifiable, Codable, Hashable {

    static func ==(lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
    
    var id: UUID
    var name: String
    var desc: String
    var phoneNumber: String
    var email: String
    var address: String
}

struct UserImage: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case id, name, image
    }

    let savePath = FileManager.documentsDirectory.appendingPathComponent("ImageContext")

    let id: UUID
    var name: String
    let image: UIImage

    init(id: UUID, name: String, image: UIImage) {
        self.id = id
        self.name = name
        self.image = image
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)

        let imageData = try container.decode(Data.self, forKey: .image)
        let decodedImage = UIImage(data: imageData) ?? UIImage()
        self.image = decodedImage
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: savePath, options: [.atomic, .completeFileProtection])
            try container.encode(jpegData, forKey: .image)
        }
    }
}

extension User {
    static var allUsers: [User] = [
    User(
        id: UUID(),
        name: "John Doe",
        desc: "General Manager",
        phoneNumber: "(+88) 17 564-890",
        email: "johndoe@gmail.com",
        address: "123 Avenue Hall Street, Florida"
    ),
    
    User(
        id: UUID(),
        name: "Maria Sanchez ",
        desc: "Product Quality Manager",
        phoneNumber: "(+88) 17 564-890",
        email: "mariasanchez@outlook.com",
        address: "1Oth Beverly Street, 987100 Washington"
    ),
    
    User(
        id: UUID(),
        name: "George de la Maison",
        desc: "French translator",
        phoneNumber: "(+33) 6 89 09 71 63",
        email: "george@delamaison.com",
        address: "17 Rue de la Fleurette, 88100 Saint-Dié-des-Vosges"
    ),
    ]
}
