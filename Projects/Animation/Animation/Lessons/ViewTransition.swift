//
//  ViewTransition.swift
//  Animation
//
//  Created by Carolane LEFEBVRE on 26/11/2022.
//

import SwiftUI

struct ViewTransition: View {
    @State private var isShowing: Bool = false
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    isShowing.toggle()
                }
            }

            if isShowing {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    //.transition(.scale)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

struct ViewTransition_Previews: PreviewProvider {
    static var previews: some View {
        ViewTransition()
    }
}
