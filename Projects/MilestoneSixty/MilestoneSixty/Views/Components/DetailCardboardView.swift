//
//  DetailCardboard.swift
//  MilestoneSixty
//
//  Created by Carolane LEFEBVRE on 02/08/2023.
//

import SwiftUI

struct DetailCardboardView: View {
    var title: String
    var text: String
    
    var body: some View {
        VStack {
            Text(title == "Company" ? "Co." : title)
                .font(.system(size: 20, weight: .bold, design: .none))
                
            Text(text)
                .foregroundColor(.blue)
                .bold()
                
        }
        .padding()
        .frame(width: 100, height: 80)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .black, radius: 3)
    }
}

struct DetailCardboard_Previews: PreviewProvider {
    static var previews: some View {
        DetailCardboardView(title: "Age", text: "21")
    }
}
