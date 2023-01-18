//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Carolane LEFEBVRE on 17/01/2023.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name", text: $order.name)
                    TextField("Street Address", text: $order.streetAddress)
                    TextField("City", text: $order.city)
                    TextField("ZIP", text: $order.zip)
                }
                
                Section {
                    NavigationLink {
                        CheckoutView(order: order)
                    } label: {
                        Text("Checkout")
                    }
                    .disabled(order.hasValidAddress == false)
                }
            }
            .navigationTitle("Delivery details")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
