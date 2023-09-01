//
//  SUISearchable.swift
//  SnowSeeker
//
//  Created by Carolane Lefebvre on 01/09/2023.
//

import SwiftUI

struct SUISearchable: View {
    @State private var searchText = ""
    let allNames = ["Subh", "Vina", "Melvin", "Stefanie"]
    
    var body: some View {
        NavigationView {
            List(filteredNames, id: \.self) { name in
                Text(name)
            }
            .searchable(text: $searchText, prompt: "Look for something")
            .navigationTitle("Searching")
        }
    }
    
    var filteredNames: [String] {
        if searchText.isEmpty {
            return allNames
        } else {
            return allNames.filter { $0.contains(searchText) }
        }
    }
}

struct SUISearchable_Previews: PreviewProvider {
    static var previews: some View {
        SUISearchable()
    }
}
