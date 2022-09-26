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
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberPeople)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = amount / 100 * tipSelection
        let grandTotal = amount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("💶 AMOUNT 💶") {
                    TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                    
                    Text(amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .foregroundColor(.red)
                        .fontWeight(.bold)
                }
                
                Section("🙋‍♀️ NUMBER OF PEOPLE 🙋‍♀️") {
                    Picker("Number of people", selection: $numberPeople) {
                        ForEach(0 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section("⭐️ TIP PERCENTAGE ⭐️") {
                    Picker("Select the tip", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("💳 TOTAL PER PERSON💳") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))

                }
                
                .navigationTitle("WeSplit")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
