//
//  AddDependenciesLesson.swift
//  HotProspects
//
//  Created by Carolane LEFEBVRE on 04/03/2023.
//

import SwiftUI
import SamplePackage

struct AddDependenciesLesson: View {
    let possibleNumbers = Array(1...60)
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init) // convert to string
        return strings.joined(separator: ", ") // join them together with commas in between
    }
    
    var body: some View {
        Text(results)
    }
}

struct AddDependenciesLesson_Previews: PreviewProvider {
    static var previews: some View {
        AddDependenciesLesson()
    }
}
