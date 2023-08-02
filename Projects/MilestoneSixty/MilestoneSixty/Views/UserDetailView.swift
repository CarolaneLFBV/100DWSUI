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
            
            Text("Registered at: \(user.registered)")
                        
            Text(user.about)
                .padding()
                .font(.subheadline)
                .foregroundColor(.blue)
            
            Spacer()

            HStack {
                DetailCardboardView(title: "Age", text: "\(user.age)")
                DetailCardboardView(title: "Company", text: "\(user.company)")
            }
            
            Spacer()
            
            Text("Address: \(user.address)")
            
            Spacer()
        }
    }
}
