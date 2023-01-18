//
//  DisableForm.swift
//  CupcakeCorner
//
//  Created by Carolane LEFEBVRE on 16/01/2023.
//

import SwiftUI

struct DisableForm: View {
    @State private var username: String = ""
    @State private var email: String = ""
    
    var disabledForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("E-mail", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("Creating...")
                }
                .disabled(disabledForm)
                /*
                 * .disabled(username.isEmpty || email.isEmpty)
                 * Disabled if username is empty or email is empty
                */
            }
        }
    }
}

struct DisableForm_Previews: PreviewProvider {
    static var previews: some View {
        DisableForm()
    }
}
