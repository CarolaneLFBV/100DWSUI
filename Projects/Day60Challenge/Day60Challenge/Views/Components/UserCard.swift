//
//  UserCard.swift
//  Day60Challenge
//
//  Created by Carolane LEFEBVRE on 29/01/2023.
//

import SwiftUI

struct UserCard: View {
    @State var user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(user.name)
                .font(.headline)
            
            HStack() {
                Circle()
                    .foregroundColor(user.isActive ? Color.green : Color.red)
                    .frame(width: 10, height: 10)
                Text("\(user.isActive ? "Connected" : "Not connected")")
            }
        }
        .padding()
    }
}

struct UserCard_Previews: PreviewProvider {
    static var previews: some View {
        UserCard(user: User.userPH)
    }
}
