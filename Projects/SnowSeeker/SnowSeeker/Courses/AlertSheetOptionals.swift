//
//  AlertSheetOptionals.swift
//  SnowSeeker
//
//  Created by Carolane Lefebvre on 01/09/2023.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct AlertSheetOptionals: View {
    @State private var selectedUser: User? = nil
    @State private var isShowingUser = false

    var body: some View {
        Text("Hello, World!")
            .onTapGesture {
                selectedUser = User()
                isShowingUser = true
            }
            .sheet(item: $selectedUser) { user in
                Text(user.id)
            }
            .alert("Welcome", isPresented: $isShowingUser, presenting: selectedUser) { user in
                Button(user.id) { }
            }
    }
}

struct AlertSheetOptionals_Previews: PreviewProvider {
    static var previews: some View {
        AlertSheetOptionals()
    }
}
