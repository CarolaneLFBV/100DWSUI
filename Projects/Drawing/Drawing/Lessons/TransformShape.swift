    //
    //  TransformShape.swift
    //  Drawing
    //
    //  Created by Carolane LEFEBVRE on 16/12/2022.
    //

import SwiftUI

struct Flower: Shape {
    // How much to move petal away from center
    var petalOffset: Double = -20
    
    // How wide each petal
    var petalWidth: Double = 100
    
    func path(in rect: CGRect) -> Path {
        // Path that will hold petals
        var path = Path()
        
        // Count from 0 to pi*2 moving up pi/8 each time
        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
            
            // Rotate the petal by the current value of the loop
            let rotation = CGAffineTransform(rotationAngle: number)
            
            // move the petal to be at the center of our view
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            
            // create path for petal using properties + fixed Y & height
            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))

            // apply rotation/position transformation to the petal
            let rotatedPetal = originalPetal.applying(position)

            // add it to our main path
            path.addPath(rotatedPetal)

        }
        
        // now send the main path back
        return path
    }
    
}


struct TransformShape: View {
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    
    var body: some View {
        VStack {
            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
                .fill(.red, style: FillStyle(eoFill: true))
            
            Text("Offset")
            Slider(value: $petalOffset, in: -40...40)
                .padding([.horizontal, .bottom])
            
            Text("Width")
            Slider(value: $petalOffset, in: 0...100)
                .padding([.horizontal, .bottom])
            
        }
    }
}

struct TransformShape_Previews: PreviewProvider {
    static var previews: some View {
        TransformShape()
    }
}
