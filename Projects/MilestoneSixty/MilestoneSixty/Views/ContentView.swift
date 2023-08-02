//
//  ContentView.swift
//  MilestoneSixty
//
//  Created by Carolane LEFEBVRE on 02/08/2023.
//

import SwiftUI

struct ContentView: View {
    @State var users = [User]()
    @StateObject var api = URLSessionAPI()
    @State var searchText = ""
    
    var filteredUsers: [User] {
        guard !searchText.isEmpty else { return users }
        return users.filter { user in
            user.name.lowercased().contains(searchText.lowercased())
        }
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredUsers) { user in
                    NavigationLink(destination: UserDetailView(user: user)) {
                        VStack {
                            HStack {
                                ActiveDotView(user: user)
                                Text(user.name)
                            }
                        }
                    }
                }
            }
            .searchable(text: $searchText)
            .onAppear {
                api.loadData { (users) in
                    self.users = users
                }
            }
            .navigationTitle("Users")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
