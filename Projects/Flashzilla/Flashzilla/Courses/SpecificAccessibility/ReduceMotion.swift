//
//  ReduceMotion.swift
//  Flashzilla
//
//  Created by Carolane Lefebvre on 22/08/2023.
//

import SwiftUI

struct ReduceMotion: View {
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @State private var scale = 1.0
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .scaleEffect(scale)
            .onTapGesture {
                withOptionalAnimation {
                    scale *= 1.5
                }
            }
//            .onTapGesture {
//                if reduceMotion {
//                    scale *= 1.5
//                } else {
//                    withAnimation {
//                        scale *= 1.5
//                    }
//                }
//            }
    }
    
    func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
        if UIAccessibility.isReduceMotionEnabled {
            return try body()
        } else {
            return try withAnimation(animation, body)
        }
    }

}

struct ReduceMotion_Previews: PreviewProvider {
    static var previews: some View {
        ReduceMotion()
    }
}
