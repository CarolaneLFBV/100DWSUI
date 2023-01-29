//
//  ContentView.swift
//  Day60Challenge
//
//  Created by Carolane LEFEBVRE on 29/01/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    func loadData() {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        let userDecoder = JSONDecoder()
        userDecoder.dateDecodingStrategy = .iso8601
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let userData = data else {
                print("No response from data: \(error?.localizedDescription ?? "Unknown")")
                return
            }
            
            do {
                users = try userDecoder.decode([User].self, from: userData)
                return
            } catch {
                print("Decoding Failed: \(error)")
            }
            
            print("Fetch Failed: \(error?.localizedDescription ?? "Unknown")")
        }
        .resume()
    }
    
    var body: some View {
        NavigationView {
            List(users) { user in
                NavigationLink(destination: UserView(user: user)) {
                    UserCard(user: user)
                }
            }
            .navigationTitle("Users List")
            .onAppear(perform: loadData)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
