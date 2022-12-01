//
//  ContentView.swift
//  iExpense
//
//  Created by Carolane LEFEBVRE on 01/12/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = ExpensesClass()
    @State private var isShowing: Bool = false
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            
                            Text(item.type)
                                .foregroundColor(item.type == "Personal" ? Color("AliceBlue") : Color("WildBlueYonder"))
                        }
                        
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: item.currency))
                            .font(.system(size: item.amount < 10 ? 15 : item.amount < 100 ? 18 : item.amount > 100 ? 20 : 0))
                            .foregroundColor(item.amount < 10 ? Color("Manatee") : item.amount < 100 ? Color("DavysGrey") : item.amount > 100 ? Color("OuterSpaceCrayola") : .black)
                    }
                }
                .onDelete(perform: removeItems)
            }
            .toolbar {
                Button {
                    isShowing.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $isShowing) {
                AddView(expenses: expenses)
            }
            .navigationTitle("iExpense")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
