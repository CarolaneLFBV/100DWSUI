//
//  CustomModifier.swift
//  ViewsandModifiers
//
//  Created by Carolane LEFEBVRE on 23/11/2022.
//

import SwiftUI


// Create the modifier
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

// convert .modifier(Title()) into a easier name
extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct CustomModifier: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .frame(width: 300, height: 200)
                .titleStyle()
                .watermarked(with: "Hacking with Swift")
        }
    }
}

struct CustomModifier_Previews: PreviewProvider {
    static var previews: some View {
        CustomModifier()
    }
}
