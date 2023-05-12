//
//  IAButton.swift
//  Animations
//
//  Created by Carolane LEFEBVRE on 05/05/2023.
//

import SwiftUI

struct IAButton: View {
    @State private var animationAmount = 1.0
    var body: some View {
        Button("Tap Me") {
            // animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeInOut(duration: 1)
                        .repeatForever(autoreverses: false),
                    value: animationAmount
                )
        )
        .onAppear {
            animationAmount = 2
        }
    }
}

struct IAButton_Previews: PreviewProvider {
    static var previews: some View {
        IAButton()
    }
}
