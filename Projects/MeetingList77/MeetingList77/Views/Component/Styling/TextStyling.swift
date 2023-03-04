//
//  TextStyling.swift
//  MeetingList77
//
//  Created by Carolane LEFEBVRE on 03/03/2023.
//

import SwiftUI


struct NavigationTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func navTitleStyle() -> some View {
        modifier(NavigationTitle())
    }
}
