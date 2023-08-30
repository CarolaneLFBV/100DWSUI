//
//  TapGestureSUI.swift
//  Flashzilla
//
//  Created by Carolane Lefebvre on 20/08/2023.
//

import SwiftUI

struct TapGestureSUI: View {
    @State private var currentAmount = 0.0
    @State private var finalAmount = 1.0
    
    var body: some View {
        
//        Text("Hello, World!")
//            .onLongPressGesture(minimumDuration: 1) {
//                print("Long pressed!")
//            } onPressingChanged: { inProgress in
//                print("In progress: \(inProgress)!")
//            }
        
        Text("Hello, World!")
            .scaleEffect(finalAmount + currentAmount)
            .gesture(
                MagnificationGesture()
                    .onChanged { amount in
                        currentAmount = amount - 1
                    }
                    .onEnded { amount in
                       finalAmount += currentAmount
                       currentAmount = 0
                   }
            )
    }
}

struct TapGestureSUI_Previews: PreviewProvider {
    static var previews: some View {
        TapGestureSUI()
    }
}
