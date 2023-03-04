//
//  ContentView.swift
//  MeetingList77
//
//  Created by Carolane LEFEBVRE on 03/03/2023.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.users, id: \.self) { user in
                    HStack {
                        
                        Spacer()
                            .frame(width: 20)
                        
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .bold()
                            
                            Text(user.desc)
                                .foregroundColor(.gray)
                        }
                    }
                    .onTapGesture {
                        viewModel.selectedUser = user
                    }
                }
                .onDelete { index in
                    viewModel.delete(at: index)
                    viewModel.save()
                }
            }
            .navigationTitle("Users List")
            .sheet(item: $viewModel.selectedUser) { user in
                UserDetailView(user: user) { newUser in
                    viewModel.update(user: newUser)
                    viewModel.save()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.addUser()
                        viewModel.save()
                    } label: {
                        Image(systemName: "plus")
                            .buttonStyle()
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
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
