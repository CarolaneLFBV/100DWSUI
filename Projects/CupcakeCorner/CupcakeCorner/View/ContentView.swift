//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Carolane LEFEBVRE on 02/07/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var order = Order()
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity)
                }
                
                Section {
                    Toggle("Special requests", isOn: $order.specialRequestEnabled.animation())
                    
                    if order.specialRequestEnabled {
                        Toggle("Extra Frosting", isOn: $order.extraFrosting)
                        Toggle("Extra Sprinkles", isOn: $order.addSparkling)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery Details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
