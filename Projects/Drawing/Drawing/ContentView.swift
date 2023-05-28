//
//  ContentView.swift
//  Drawing
//
//  Created by Carolane LEFEBVRE on 23/05/2023.
//

import SwiftUI

struct Arrow: Shape {
    var headHeight = 0.5
    var shaftWidth = 0.5
    
    var animatableData: AnimatablePair<Double, Double> {
        get { AnimatablePair(headHeight, shaftWidth) }
        set {
            shaftWidth = newValue.first
            headHeight = newValue.second
        }
    }
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: rect.midX, y: 0))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX + 50, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX + 50, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX - 50, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX - 50, y: rect.midY))
            path.addLine(to: CGPoint(x: 0, y: rect.midY))
            path.closeSubpath()
        }
    }
}

struct ContentView: View {
    @State private var headHeight = 0.5
    @State private var shaftWidth = 0.5
    var body: some View {
        VStack {
            Arrow(headHeight: headHeight, shaftWidth: shaftWidth)
                .fill(.blue)
                .onTapGesture {
                    withAnimation {
                        headHeight = Double.random(in: 0.2...0.8)
                        shaftWidth = Double.random(in: 0.2...0.8)
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
