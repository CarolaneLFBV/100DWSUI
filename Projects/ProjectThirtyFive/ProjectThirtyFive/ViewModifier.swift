//
//  ViewModifier.swift
//  ProjectThirtyFive
//
//  Created by Carolane LEFEBVRE on 12/05/2023.
//

import SwiftUI

struct WhiteRoundedBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 200)
            .foregroundColor(.black)
            .padding()
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

extension View {
    func roundBackground() -> some View {
        modifier(WhiteRoundedBackground())
    }
}
