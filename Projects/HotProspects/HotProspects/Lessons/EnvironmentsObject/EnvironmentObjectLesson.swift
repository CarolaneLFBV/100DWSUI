//
//  EnvironmentObjectLesson.swift
//  HotProspects
//
//  Created by Carolane LEFEBVRE on 04/03/2023.
//

import SwiftUI


@MainActor class User: ObservableObject {
    @Published var name = "Taylor Swift"
}

struct EditView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        Text(user.name)
    }
}

struct EnvironmentObjectLesson_Previews: PreviewProvider {
    static var previews: some View {
        DisplayView()
    }
}
