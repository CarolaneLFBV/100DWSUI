//
//  UserDetailVie.swift
//  MeetingList77
//
//  Created by Carolane LEFEBVRE on 03/03/2023.
//

import SwiftUI

struct UserDetailView: View {
    @Environment(\.dismiss) var dismiss
    var onSave: (User) -> Void
    @StateObject private var viewModel: ViewModel
    
    @State private var isPresented: Bool = false
    @State private var isUnlocked: Bool = false
    
    init(user: User, onSave: @escaping (User) -> Void) {
        _viewModel = StateObject(wrappedValue: ViewModel(user: user))

        self.onSave = onSave
    }

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Person's name", text: $viewModel.name)
                    TextField("Short description", text: $viewModel.desc)
                }
                
                Section {
                    TextField("Phone Number", text: $viewModel.phoneNumber)
                    TextField("Email", text: $viewModel.email)
                    TextField("Address", text: $viewModel.address)
                }
                
                if isUnlocked {
                    Button("Save") {
                        var newUser = viewModel.user
                        newUser.id = UUID()
                        newUser.name = viewModel.name
                        newUser.desc = viewModel.desc
                        newUser.phoneNumber = viewModel.phoneNumber
                        newUser.email = viewModel.email
                        newUser.address = viewModel.address

                        onSave(newUser)
                        isPresented = true
                    }
                }
                
                UserImageView()
            }
            .navigationTitle("Details")
            .alert(isPresented: $isPresented) {
                Alert(title: Text("Success"), message: Text("Details of this person changed with success!"), dismissButton: .default(Text("OK")))
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .buttonStyle()

                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isUnlocked = true
                    } label: {
                        Image(systemName: "pencil")
                            .buttonStyle()

                    }
                }
            }
        }
    }
    
}
