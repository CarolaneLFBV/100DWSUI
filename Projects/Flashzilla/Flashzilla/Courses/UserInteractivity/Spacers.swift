//
//  Spacers.swift
//  Flashzilla
//
//  Created by Carolane Lefebvre on 22/08/2023.
//

import SwiftUI

struct Spacers: View {
    var body: some View {
        VStack {
            Text("Hello")
            Spacer().frame(height: 100)
            Text("World")
        }
        .contentShape(Rectangle())
        .onTapGesture {
            print("VStack tapped!")
        }
    }
}

struct Spacers_Previews: PreviewProvider {
    static var previews: some View {
        Spacers()
    }
}
