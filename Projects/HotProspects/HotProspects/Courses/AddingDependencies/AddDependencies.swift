//
//  AddDependencies.swift
//  HotProspects
//
//  Created by Carolane LEFEBVRE on 17/08/2023.
//

import SwiftUI
import SamplePackage

struct AddDependencies: View {
    let possibleNumbers = Array(1...60)
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        
        // converts in string
        let strings = selected.map(String.init)
        
        return strings.joined(separator: ", ")
    }
    
    var body: some View {
        Text(results)
    }
}

struct AddDependencies_Previews: PreviewProvider {
    static var previews: some View {
        AddDependencies()
    }
}
