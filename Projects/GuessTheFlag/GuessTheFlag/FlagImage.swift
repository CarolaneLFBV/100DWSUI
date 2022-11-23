//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Carolane LEFEBVRE on 23/11/2022.
//

import SwiftUI

// MARK: - Images Flag

struct ImageFlag: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

extension View {
    func frameStyle() -> some View {
        modifier(ImageFlag())
    }
}

// MARK: - Rounded Flag

struct RoundedFlag: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

extension View {
    func roundedFlagStyle() -> some View {
        modifier(RoundedFlag())
    }
}
