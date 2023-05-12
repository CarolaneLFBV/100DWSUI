    //
    //  VATButton.swift
    //  Animations
    //
    //  Created by Carolane LEFEBVRE on 09/05/2023.
    //

import SwiftUI

struct VATButton: View {
    @State private var isShowingRed = false

    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

struct VATButton_Previews: PreviewProvider {
    static var previews: some View {
        VATButton()
    }
}
