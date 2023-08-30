//
//  RectangleCircle.swift
//  Flashzilla
//
//  Created by Carolane Lefebvre on 22/08/2023.
//

import SwiftUI

struct RectangleCircle: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("Rectangle tapped!")
                }
            
            Circle()
                .fill(.red)
                .frame(width: 300, height: 300)
                .contentShape(Rectangle())
                .onTapGesture {
                    print("Circle tapped!")
                }
                //.allowsHitTesting(false)
        }
    }
}

struct RectangleCircle_Previews: PreviewProvider {
    static var previews: some View {
        RectangleCircle()
    }
}
