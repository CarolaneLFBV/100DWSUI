//
//  CategoryCard.swift
//  47HabitTrack
//
//  Created by Carolane LEFEBVRE on 20/12/2022.
//

import SwiftUI

struct CategoryCard: View {
    @State var category: Category
    
    var body: some View {
        VStack {
            category.image?
                .resizable()
                .scaledToFit()
            
            Text(category.name)
                .foregroundColor(.white)
                .font(.system(size: 14, weight: .semibold, design: .none))
        }
        .categoryCardBG()
    }
}

struct CategoryCard_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCard(category: Category(name: "Education", image: Image("education")))
    }
}
