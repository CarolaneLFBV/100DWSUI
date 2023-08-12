//
//  UserRowView.swift
//  MilestoneSeventySeven
//
//  Created by Carolane LEFEBVRE on 12/08/2023.
//

import SwiftUI

struct UserRowView: View {
    let user: User
    @State private var image: Image?
    
    var body: some View {
        HStack {
            image?
                .resizable()
                .scaledToFit()
                .frame(height: 80)
            
            VStack(alignment: .leading) {
                Text(user.name)
                    .font(.title3)
                    .bold()
                
                Text(user.description)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .onAppear(perform: loadImage)
    }
    
    func loadImage() {
        image = user.convertDataToImg()
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(user: User.example)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
