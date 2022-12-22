//
//  CaptionActivity.swift
//  47HabitTrack
//
//  Created by Carolane LEFEBVRE on 20/12/2022.
//

import SwiftUI

struct Caption: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundColor(Color("DesertSand"))
    }
}

extension View {
    func captionStyle() -> some View {
        modifier(Caption())
    }
}

struct CaptionActivity: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .captionStyle()
    }
}

struct CaptionActivity_Previews: PreviewProvider {
    static var previews: some View {
        CaptionActivity()
    }
}
