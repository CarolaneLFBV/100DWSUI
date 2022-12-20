//
//  CategoryTag.swift
//  47HabitTrack
//
//  Created by Carolane LEFEBVRE on 20/12/2022.
//

import SwiftUI

struct Tag: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .padding(10)
            .foregroundColor(.white)
            .background(Color("EtonBlue"))
            .clipShape(RoundedRectangle(cornerRadius: 100))
    }
}

extension View {
    func cardTag() -> some View {
        modifier(Tag())
    }
}
