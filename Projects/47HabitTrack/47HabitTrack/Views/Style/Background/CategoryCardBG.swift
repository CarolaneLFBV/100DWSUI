//
//  CategoryCardBG.swift
//  47HabitTrack
//
//  Created by Carolane LEFEBVRE on 22/12/2022.
//

import SwiftUI

struct CardCategoryBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 110, height: 80)
            .padding()
            .background(Color("MidnightGreen"))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: Color("MidnightGreen").opacity(0.4), radius: 5, x: 5, y: 5)
    }
}

extension View {
    func categoryCardBG() -> some View {
        modifier(CardCategoryBackground())
    }
}


struct CategoryCardBG: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CategoryCardBG_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCardBG()
    }
}
