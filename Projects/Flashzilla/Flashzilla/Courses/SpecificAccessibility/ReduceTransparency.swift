//
//  ReduceTransparency.swift
//  Flashzilla
//
//  Created by Carolane Lefebvre on 22/08/2023.
//

import SwiftUI

struct ReduceTransparency: View {
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    
    var body: some View {
        Text("Hello, World!")
            .padding()
            .background(reduceTransparency ? .black : .black.opacity(0.5))
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}

struct ReduceTransparency_Previews: PreviewProvider {
    static var previews: some View {
        ReduceTransparency()
    }
}
