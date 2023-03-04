    //
    //  ContextMenusLesson.swift
    //  HotProspects
    //
    //  Created by Carolane LEFEBVRE on 04/03/2023.
    //

import SwiftUI

struct ContextMenusLesson: View {
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
                            .foregroundColor(.red)
                    }
                    
                    Button {
                        backgroundColor = .green
                    } label: {
                        Label("Green", systemImage: "checkmark.circle.fill")
                            .foregroundColor(.green)
                    }
                    
                    Button(role: .cancel) {
                        backgroundColor = .blue
                    } label: {
                        Label("Blue", systemImage: "checkmark.circle.fill")
                            .foregroundColor(.blue)
                    }
                }
        }
    }
}

struct ContextMenusLesson_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenusLesson()
    }
}
