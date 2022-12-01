//
//  StateToStruct.swift
//  iExpense
//
//  Created by Carolane LEFEBVRE on 01/12/2022.
//

import SwiftUI

struct StateToStruct: View {
    @StateObject var user = User()

       var body: some View {
           VStack {
               Text("Your name is \(user.firstName) \(user.lastName).")

               TextField("First name", text: $user.firstName)
               TextField("Last name", text: $user.lastName)
           }
       }
}

struct StateToStruct_Previews: PreviewProvider {
    static var previews: some View {
        StateToStruct()
    }
}
