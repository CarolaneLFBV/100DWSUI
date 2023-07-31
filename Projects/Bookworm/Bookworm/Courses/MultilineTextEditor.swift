//
//  MultilineTextEditor.swift
//  Bookworm
//
//  Created by Carolane LEFEBVRE on 31/07/2023.
//

import SwiftUI

struct MultilineTextEditor: View {
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationView {
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

struct MultilineTextEditor_Previews: PreviewProvider {
    static var previews: some View {
        MultilineTextEditor()
    }
}
