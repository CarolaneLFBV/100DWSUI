//
//  TextStyle.swift
//  RockPaperScissors
//
//  Created by Carolane LEFEBVRE on 23/11/2022.
//

import SwiftUI
// MARK: - Text style

struct setTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.white)
            .bold()
    }
}

extension View {
    func styleText() -> some View {
        modifier(setTextStyle())
    }
}

// MARK: - Relation text style
struct relationText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.yellow)
            .bold()
    }
}

extension View {
    func styleRelation() -> some View {
        modifier(relationText())
    }
}

// MARK: - Preview

struct TextStyle: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .styleRelation()
    }
}

struct TextStyle_Previews: PreviewProvider {
    static var previews: some View {
        TextStyle()
    }
}
