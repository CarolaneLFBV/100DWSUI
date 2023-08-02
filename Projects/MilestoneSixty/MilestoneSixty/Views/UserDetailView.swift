//
//  UserDetailView.swift
//  MilestoneSixty
//
//  Created by Carolane LEFEBVRE on 02/08/2023.
//

import SwiftUI

struct UserDetailView: View {
    @State var user: User
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(user.name)
                .font(.title)
            
            HStack {
                ActiveDotView(user: user)
                Text(user.isActive == true ? "Connected" : "Disconnected")
            }
            
            Text(user.about)
                .padding()
                .font(.subheadline)
                .foregroundColor(.blue)
                        
            HStack {
                DetailCardboardView(title: "Age", text: "\(user.age)")
                DetailCardboardView(title: "Company", text: "\(user.company)")
            }
                                    
            List {
                
                Section("Informations") {
                    Text("Address: \(user.address)")
                    Text("Mail: \(user.email)")
                }
                
                Section("Friends") {
                    ForEach(user.friends) { friend in
                        Text(friend.name)
                    }
                }
            }
        }
    }
}


struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(user: User(isActive: true, name: "William", age: 21, company: "Inkram", email: "william@mail.com", address: "1234 Avenur Street", about: "Relatives from my mom's birthday", registered: "", tags: ["tag1", "tag2"], friends: [Friend(name: "Richard"), Friend(name: "Melanie")]))
    }
}
