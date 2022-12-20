//
//  TitleActivity.swift
//  47HabitTrack
//
//  Created by Carolane LEFEBVRE on 20/12/2022.
//

import SwiftUI


// Create the modifier
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .bold()
    }
}

// convert .modifier(Title()) into a easier name
extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}


struct TitleActivity: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .titleStyle()
            .background(.primary)
    }
}

struct TitleActivity_Previews: PreviewProvider {
    static var previews: some View {
        TitleActivity()
    }
}
