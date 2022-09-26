//
//  ContentView.swift
//  WeSplit
//
//  Created by Carolane on 25/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var amount : Double = 0.0
    @State private var numberPeople: Int = 0
    @State private var tipPercentage = 10
    
    // Challenge
    let tipPercentages = 1...100
    //let tipPercentages = [10, 15, 20, 25, 0]
    
    @FocusState private var isFocused: Bool
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberPeople)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = amount / 100 * tipSelection
        let grandTotal = amount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var totalWithoutTip: Double {
        let tipValue = amount / 100 * Double(tipPercentage)
        let grandTotal = amount + tipValue
        
        return grandTotal
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("💶 Amount ") {
                    TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                    
                    Text(amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .foregroundColor(.red)
                        .fontWeight(.bold)
                }
                
                Section("🙋‍♀️ Number of people") {
                    Picker("Number of people", selection: $numberPeople) {
                        ForEach(0 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section("⭐️ Tip percentage") {
                    Picker("Select the tip", selection: $tipPercentage) {
                    
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    //.pickerStyle(.segmented)
                }
                
                // Challenge
                Section("💳 Total Amount") {
                    Text(totalWithoutTip, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("🍽 Amount per person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                .navigationTitle("WeSplit")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        
                        Button("Done") {
                            isFocused = false
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
