//
//  AnimatedButton.swift
//  Animation
//
//  Created by Carolane LEFEBVRE on 25/11/2022.
//

import SwiftUI

struct AnimatedButton: View {
    
    @State private var animationAmount: Double = 1.0
    
    var body: some View {
        VStack {
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
}

struct AnimatedButton_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedButton()
    }
}
