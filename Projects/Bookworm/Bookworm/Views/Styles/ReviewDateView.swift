//
//  ReviewDateView.swift
//  Bookworm
//
//  Created by Carolane LEFEBVRE on 27/01/2023.
//

import SwiftUI

struct ReviewDateView: View  {
    let date: String
    var body: some View {
        HStack {
            Label ("\(date)", systemImage: "text.badge.checkmark")
                .font(.callout)
                .padding([.trailing, .leading])
                .background(.indigo)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .padding()
            Spacer()
        }
    }
}
