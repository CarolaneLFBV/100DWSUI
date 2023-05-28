//
//  SpecialEffects.swift
//  Drawing
//
//  Created by Carolane LEFEBVRE on 28/05/2023.
//

import SwiftUI

struct SpecialEffectsCircles: View {
    @State private var amount = 0.0
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(.red)
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(.green)
                    .frame(width: 200 * amount)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(.blue)
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}

struct SpecialEffects: View {
    var body: some View {
        ZStack {
            Image("example")
                .resizable()
                .scaledToFit()
                .colorMultiply(.red)

            
            /*
             Rectangle()
                .fill(.red)
                .blendMode(.multiply)
             // multiplies each source pixel color with the destination pixel color
             */
        }
        .frame(width: 400, height: 400)
        .clipped()
    }
}

struct SpecialEffects_Previews: PreviewProvider {
    static var previews: some View {
        SpecialEffectsCircles()
    }
}
