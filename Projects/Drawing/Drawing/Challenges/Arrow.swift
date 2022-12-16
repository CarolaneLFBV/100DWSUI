//
//  Arrow.swift
//  Drawing
//
//  Created by Carolane LEFEBVRE on 16/12/2022.
//

import SwiftUI

struct Arrow: View {
    var widthArrow: Double = 50.0
    static let symbolColor = Color(red: 79.0 / 255, green: 79.0 / 255, blue: 191.0 / 255)

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = min(geometry.size.width, geometry.size.height)
                let height = width * 0.75
                let spacing = width * 0.030
                let middle = width * 0.5
                let topWidth = width * 0.226
                let topHeight = height * 0.488

                path.addLines([
                    CGPoint(x: middle, y: spacing),
                    CGPoint(x: middle - topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: topHeight / 2 + spacing),
                    CGPoint(x: middle + topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: spacing)
                ])
            }
            .fill(Self.symbolColor)
            
            Rectangle()
                .fill(Self.symbolColor)
                .frame(width: widthArrow, height: 100)
                .position(x: 195, y: 130)
        }
    }
}

