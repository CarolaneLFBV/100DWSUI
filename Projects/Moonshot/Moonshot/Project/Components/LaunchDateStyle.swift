//
//  ImageStyling.swift
//  Moonshot
//
//  Created by Carolane LEFEBVRE on 01/12/2022.
//

import SwiftUI

struct LaunchStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(height: 25)
            .background(.white.opacity(0.5))
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

// convert .modifier(Title()) into a easier name
extension View {
    func launchStyle() -> some View {
        modifier(LaunchStyle())
    }
}

struct LaunchDateStyle: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .launchStyle()
    }
}

struct LaunchDateStyle_Previews: PreviewProvider {
    static var previews: some View {
        LaunchDateStyle()
    }
}
