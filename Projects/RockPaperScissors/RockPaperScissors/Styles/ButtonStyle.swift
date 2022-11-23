//
//  ButtonStyle.swift
//  RockPaperScissors
//
//  Created by Carolane LEFEBVRE on 23/11/2022.
//

import SwiftUI


struct styleButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.black.opacity(0.5), in: Capsule())
    }
}

extension View {
    func buttonStyle() -> some View {
        modifier(styleButton())
    }
}

struct ButtonStyle: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .buttonStyle()
    }
}

struct ButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyle()
    }
}
