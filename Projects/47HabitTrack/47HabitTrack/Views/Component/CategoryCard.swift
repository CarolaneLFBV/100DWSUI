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
        .frame(width: 110, height: 80)
        .padding()
        .background(Color("MidnightGreen"))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: Color("MidnightGreen").opacity(0.4), radius: 5, x: 5, y: 5)
    }
}

struct CategoryCard_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCard(category: Category(name: "Education", image: Image("education")))
    }
}
