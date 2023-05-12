//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Carolane LEFEBVRE on 10/05/2023.
//

import SwiftUI

struct FlagImage: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 5)
    }
}

extension View {
    func flagStyle() -> some View {
        modifier(FlagImage())
    }
}


// MARK: - Frame

struct FrameStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 350, height: 500)
            .padding(.vertical, 20)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

extension View {
    func frameStyle() -> some View {
        modifier(FrameStyle())
    }
}
