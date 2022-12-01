//
//  AddView.swift
//  iExpense
//
//  Created by Carolane LEFEBVRE on 01/12/2022.
//

import SwiftUI

struct AddView: View {
    @State private var name: String = ""
    @State private var type: String = "Personal"
    @State private var currency: String = "USD"
    @State private var amount: Double = 0.0
    let types = ["Business", "Personal"]
    let currencies = ["USD", "EUR"]
    
    @ObservedObject var expenses: ExpensesClass
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                Picker("Currency", selection: $currency) {
                    ForEach(currencies, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: currency))
                    .keyboardType(.decimalPad)
                
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount, currency: currency)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: ExpensesClass())
    }
}
