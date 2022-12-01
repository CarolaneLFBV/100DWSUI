//
//  ExpenseClass.swift
//  iExpense
//
//  Created by Carolane LEFEBVRE on 01/12/2022.
//

import SwiftUI

class ExpensesClass: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    /*
     * 1. Attempt to read the “Items” key from UserDefaults.
     * 2. Create an instance of JSONDecoder, which is the counterpart of JSONEncoder that lets us go from JSON data to Swift objects.
     * 3. Ask the decoder to convert the data we received from UserDefaults into an array of ExpenseItem objects.
     * 4. If that worked, assign the resulting array to items and exit.
     * 5. Otherwise, set items to be an empty array.
     */
    init() {
        // 1.
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            // 2. + 3.
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                //4.
                items = decodedItems
                return
            }
        }
        //5.
        items = []
    }
    
}
