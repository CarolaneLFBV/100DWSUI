//
//  ActivityCardBG.swift
//  47HabitTrack
//
//  Created by Carolane LEFEBVRE on 20/12/2022.
//

import SwiftUI

struct Background: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(width: 350)
            .background(Color("TealBlue"))
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func cardbackground() -> some View {
        modifier(Background())
    }
}

struct ActivityCardBG: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .cardbackground()
    }
}

struct ActivityCardBG_Previews: PreviewProvider {
    static var previews: some View {
        ActivityCardBG()
    }
}
