//
//  ContextMenu.swift
//  HotProspects
//
//  Created by Carolane LEFEBVRE on 17/08/2023.
//

import SwiftUI

struct ContextMenu: View {
    @State private var backgroundColor = Color.red
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding()
                .background(backgroundColor)
            
            Text("Change Color")
                .padding()
                .contextMenu {
                    Button(role: .destructive) {
                        backgroundColor = .red
                    } label: {
                        Label("Red", systemImage: "checkmark.circle.fill")
                    }
                    
                    Button {
                        backgroundColor = .green
                    } label: {
                        Label("Green", systemImage: "checkmark.circle.fill")
                    }
                    
                    Button {
                        backgroundColor = .blue
                    } label: {
                        Label("Blue", systemImage: "checkmark.circle.fill")
                    }
                }
        }
    }
}

struct ContextMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenu()
    }
}
