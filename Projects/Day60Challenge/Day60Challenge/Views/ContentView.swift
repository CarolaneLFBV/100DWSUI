    //
    //  ContentView.swift
    //  Day60Challenge
    //
    //  Created by Carolane LEFEBVRE on 29/01/2023.
    //

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: CachedUser.entity(), sortDescriptors: []) var cachedUsers: FetchedResults<CachedUser>
    
    func loadData() async -> [User]? {
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decodedData = try decoder.decode([User].self, from: data)
            return decodedData
        } catch {
            print(error)
        }
        return nil
    }
    
    var body: some View {
        NavigationStack {
            List(cachedUsers) { user in
                NavigationLink(destination: UserView(user: user)) {
                    UserCard(user: user)
                }
            }
            .navigationTitle("Users List")
            .task {
                if cachedUsers.isEmpty {
                    if let retrievedUsers = await loadData() {
                        users = retrievedUsers
                    }
                    
                    await MainActor.run {
                        for user in users {
                            let newUser = CachedUser(context: moc)
                            newUser.name = user.name
                            newUser.id = user.id
                            newUser.isActive = user.isActive
                            newUser.age = Int16(user.age)
                            newUser.about = user.about
                            newUser.email = user.email
                            newUser.address = user.address
                            newUser.company = user.company
                            newUser.formattedDate = user.formattedDate
                            
                            for friend in user.friends {
                                let newFriend = CachedFriend(context: moc)
                                newFriend.id = friend.id
                                newFriend.name = friend.name
                                newFriend.user = newUser
                            }
                            
                            try? moc.save()
                        }
                    }
                }
            } //task
        }
    }
}
        
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
