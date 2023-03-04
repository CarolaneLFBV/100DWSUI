//
//  ButtonStyling.swift
//  MeetingList77
//
//  Created by Carolane LEFEBVRE on 04/03/2023.
//

import SwiftUI

struct ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 13))
            .frame(width: 15, height: 15)
            .padding(5)
            .background(.black.opacity(0.75))
            .foregroundColor(.white)
            .font(.title)
            .clipShape(Circle())
    }
}

extension View {
    func buttonStyle() -> some View {
        modifier(ButtonStyle())
    }
}
