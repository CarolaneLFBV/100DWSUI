//
//  ActiveIndicator.swift
//  Day60Challenge
//
//  Created by Carolane LEFEBVRE on 29/01/2023.
//

import SwiftUI

struct ActivityIndicator: View {
    var isActive: Bool

    var body: some View {
        HStack {
            Spacer()
            VStack {
                Circle()
                    .fill(isActive ? Color("green") : Color("red"))
                    .frame(width: 20, height: 20)
                Spacer()
            }
            .padding([.trailing, .top], 10)
        }
    }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator(isActive: true)
    }
}
