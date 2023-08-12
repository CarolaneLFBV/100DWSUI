//
//  ContentView.swift
//  MilestoneSeventySeven
//
//  Created by Carolane LEFEBVRE on 12/08/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAddUserView = false
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.users) { user in
                    UserRowView(user: user)
                }
                .onDelete { index in
                    viewModel.removeUser(at: index)
                }
            }
            .navigationTitle("Users meetups")
            .sheet(isPresented: $showingAddUserView) {
                AddUserView(viewModel: viewModel)
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        showingAddUserView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
