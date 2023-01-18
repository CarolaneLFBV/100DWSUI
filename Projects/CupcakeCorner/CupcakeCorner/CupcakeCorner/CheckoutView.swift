//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Carolane LEFEBVRE on 17/01/2023.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order
    @State private var confirmMessage: String = ""
    @State private var showingConfirmation: Bool = false
    @State private var showingError: Bool = false
    
    func placeOrder() async {
        // -------- Convert the order into a JSON file --------
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        // -------- Send data over the network --------
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //request.httpMethod = "POST"
        // -------- Run and proceed the response --------
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            showingConfirmation = true
        } catch {
            confirmMessage = "Oh no! Something wrong happened!"
            showingError = true
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Check out")
                    .bold()
                
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                    
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total is : \(order.costs, format: .currency(code: "USD"))")
                    .font(.title)
                
                Button("Place order") {
                    Task{
                        await placeOrder()
                    }
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .alert("Thank you!", isPresented: $showingConfirmation) {
                Button("OK") { }
            } message: {
                Text(confirmMessage)
            }
            
            .alert("Alert", isPresented: $showingError) {
                Button("Try again") { }
            } message: {
                Text(confirmMessage)
            }

        } 
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
