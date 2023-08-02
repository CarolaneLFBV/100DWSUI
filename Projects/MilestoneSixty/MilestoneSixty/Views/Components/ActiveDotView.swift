//
//  ActiveDotView.swift
//  MilestoneSixty
//
//  Created by Carolane LEFEBVRE on 02/08/2023.
//

import SwiftUI

struct ActiveDotView: View {
    @State var user: User
    
    var body: some View {
        Circle()
            .foregroundColor(user.isActive == true ? .green : .red)
            .frame(maxWidth: 10)
    }
}
