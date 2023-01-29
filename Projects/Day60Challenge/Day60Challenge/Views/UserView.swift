    //
    //  UserView.swift
    //  Day60Challenge
    //
    //  Created by Carolane LEFEBVRE on 29/01/2023.
    //

import SwiftUI

struct UserView: View {
    let user: CachedUser
    
    var body: some View {
        VStack() {
            Text("🙂 \(user.wrappedName)")
                .font(.system(size: 35, weight: .bold, design: .default))
            
            VStack {
                Text("💬 \(user.wrappedAbout)")
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding()
            
            VStack(alignment: .leading) {
                Text("Informations about \(user.wrappedName):")
                    .font(.headline)
                    .padding(.bottom, 4)
                
                VStack(alignment: .leading) {
                    Text("📍 Adress: \(user.wrappedAddress)")
                    Text("📨 Email: \(user.wrappedEmail)")
                    Text("🏢 Works at: \(user.wrappedCompany)")
                }
                .font(.system(size: 20))
            }
            .padding()
            
            VStack(alignment: .leading) {
                Text("Friend(s) list: ")
                ForEach(user.friendsArray, id: \.self) { friend in
                    Text("👤 \(friend.wrappedName)")
                        .font(.system(size: 20, weight: .medium, design: .default))
                }
            }
            .font(.title3)
            .padding()
        }
    }
}
