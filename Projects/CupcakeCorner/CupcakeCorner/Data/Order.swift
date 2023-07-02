//
//  Order.swift
//  CupcakeCorner
//
//  Created by Carolane LEFEBVRE on 02/07/2023.
//

import SwiftUI

class Order: ObservableObject {
    // Cupcakes
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
    
    // Address
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        return true
    }
    
}
