//
//  DeleteItems.swift
//  iExpense
//
//  Created by Carolane LEFEBVRE on 01/12/2022.
//

import SwiftUI

struct DeleteItems: View {
    @State private var numbers = [Int]()
    @State private var currentNumber: Int = 1
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .toolbar {
                EditButton()
            }
        }
    }
}

struct DeleteItems_Previews: PreviewProvider {
    static var previews: some View {
        DeleteItems()
    }
}
