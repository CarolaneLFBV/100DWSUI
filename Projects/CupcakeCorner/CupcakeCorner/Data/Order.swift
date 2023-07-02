//
//  Order.swift
//  CupcakeCorner
//
//  Created by Carolane LEFEBVRE on 02/07/2023.
//

import SwiftUI

class Order: ObservableObject, Codable {
    
    init() { }
    
    // MARK: - Cupcakes
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSparkling = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSparkling = false
    
    // MARK: - Address
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || streetAddress.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        return true
    }
    
    // MARK: - Checkout
    var cost: Double {
        var cost = Double(quantity) * 2
        cost += (Double(type) / 2)
        
        // 1$/cake
        if extraFrosting {
            cost += Double(quantity)
        }
        
        // 0.5$/cake
        if addSparkling {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
    
    // MARK: - Codable data
    enum CodingKeys: CodingKey {
        case type, quantity, extraFrosting, addSparkling, name, streetAddress, city, zip
    }
    
    // Encoding
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)
        
        try container.encode(extraFrosting, forKey: .extraFrosting)
        try container.encode(addSparkling, forKey: .addSparkling)
        
        try container.encode(name, forKey: .name)
        try container.encode(streetAddress, forKey: .streetAddress)
        try container.encode(city, forKey: .city)
        try container.encode(zip, forKey: .zip)
    }
    
    // Decoding
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)
        
        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
        addSparkling = try container.decode(Bool.self, forKey: .addSparkling)
        
        name = try container.decode(String.self, forKey: .name)
        streetAddress = try container.decode(String.self, forKey: .streetAddress)
        city = try container.decode(String.self, forKey: .city)
        zip = try container.decode(String.self, forKey: .zip)
    }
    
}
