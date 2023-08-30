//
//  HighPriorityGesture.swift
//  Flashzilla
//
//  Created by Carolane Lefebvre on 21/08/2023.
//

import SwiftUI

struct HighPriorityGesture: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .onTapGesture {
                    print("Text tapped")
                }
        }
        .highPriorityGesture(
            TapGesture()
                .onEnded { _ in
                    print("VStack tapped")
                }
        )
    }
}

struct HighPriorityGesture_Previews: PreviewProvider {
    static var previews: some View {
        HighPriorityGesture()
    }
}
