//
//  User.swift
//  CupcakeCorner
//
//  Created by Carolane LEFEBVRE on 15/01/2023.
//

import Foundation

class User: ObservableObject, Codable {
    var name = "Paul"
    
    
    // Loads & saves any variable
    enum CodingKeys: CodingKey {
        case name
    }
    
    /*
     * Decoder: contains all the data
     * Required: allows subclasses to override the init with custom implementation
     * decoder.container(keyedBy: CodingKeys.self): asks Decoder instance to match all the coding keys set in CodingKey
     * container.decode(String.self, forKey: .name): read values directly from the container.
     */
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    /*
     * Encode: instance to write to
     * encoder.container(keyedBy: CodingKeys.self): make a container
     * container.encode(name, forKey: .name): write values attached to each key
     */
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}
