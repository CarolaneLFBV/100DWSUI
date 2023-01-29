    //
    //  UserView.swift
    //  Day60Challenge
    //
    //  Created by Carolane LEFEBVRE on 29/01/2023.
    //

import SwiftUI

struct UserView: View {
    @State var user: User
    
    var body: some View {
        VStack() {
            Text("🙂 \(user.name)")
                .font(.system(size: 35, weight: .bold, design: .default))
            
            VStack {
                Text("💬 \(user.about)")
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding()
            
            VStack(alignment: .leading) {
                Text("Informations about \(user.name):")
                    .font(.headline)
                    .padding(.bottom, 4)
                
                VStack(alignment: .leading) {
                    Text("📍 Adress: \(user.address)")
                    Text("📨 Email: \(user.email)")
                    Text("🏢 Works at: \(user.company)")
                }
                .font(.system(size: 20))
            }
            .padding()
            
            VStack(alignment: .leading) {
                Text("Friend(s) list: ")
                ForEach(user.friends, id: \.self) { friend in
                    Text("👤 \(friend.name)")
                        .font(.system(size: 20, weight: .medium, design: .default))
                }
            }
            .font(.title3)
            .padding()
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: User.userPH)
    }
}
