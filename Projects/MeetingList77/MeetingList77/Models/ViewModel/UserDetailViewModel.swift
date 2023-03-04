//
//  UserDetailViewModel.swift
//  MeetingList77
//
//  Created by Carolane LEFEBVRE on 04/03/2023.
//

import Foundation

extension UserDetailView {
    @MainActor class ViewModel: ObservableObject {
        var user: User
        
        @Published var name: String
        @Published var desc: String
        @Published var phoneNumber: String
        @Published var email: String
        @Published var address: String
        
        let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedUsers")
        
        init(user: User) {
            name = user.name
            desc = user.desc
            phoneNumber = user.phoneNumber
            email = user.email
            address = user.address
            self.user = user
        }
        
    }
}
