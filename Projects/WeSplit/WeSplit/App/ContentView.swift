    //
    //  ContentView.swift
    //  WeSplit
    //
    //  Created by Carolane LEFEBVRE on 03/04/2023.
    //

import SwiftUI

struct ContentView: View {
    @FocusState private var amountIsFocused: Bool

    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    let tipPercentages = 0..<101
    let localCurrency: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currency?.identifier ?? "USD")
    
    var totalPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        
        return checkAmount + tipValue

    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Total Amount") {
                    TextField("Amount", value: $checkAmount, format: localCurrency)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section("Tip percentage") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    //.pickerStyle(.segmented)
                }
                
                Section("Amount/pers") {
                    Text(totalPerson, format: localCurrency)
                        //.foregroundColor(totalPerson < 50 ? .green : totalPerson < 100 ? .orange : totalPerson > 100 ? .red : .black)
                        .foregroundColor(tipPercentage <= 0 ? .red : .black)

                    Text("Total Amount: \(grandTotal, format: localCurrency)")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()

                    Button("Done") {
                        amountIsFocused = false
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
