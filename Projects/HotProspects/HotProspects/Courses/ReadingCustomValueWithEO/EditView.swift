//
//  EditView.swift
//  HotProspects
//
//  Created by Carolane LEFEBVRE on 16/08/2023.
//

import SwiftUI

struct EditView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        TextField("Name", text: $user.name)
    }
}


struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}
