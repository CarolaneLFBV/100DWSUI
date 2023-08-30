//
//  SimultaneousGesture.swift
//  Flashzilla
//
//  Created by Carolane Lefebvre on 21/08/2023.
//

import SwiftUI

struct SimultaneousGesture: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .onTapGesture {
                    print("Text tapped")
                }
        }
        .simultaneousGesture(
            TapGesture()
                .onEnded { _ in
                    print("VStack tapped")
                }
        )
    }
}

struct SimultaneousGesture_Previews: PreviewProvider {
    static var previews: some View {
        SimultaneousGesture()
    }
}
