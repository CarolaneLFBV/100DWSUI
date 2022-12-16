//
//  PathvsShape.swift
//  Drawing
//
//  Created by Carolane LEFEBVRE on 02/12/2022.
//

/*
 * Path is a series of drawing instructions such as “start here, draw a line to here, then add a circle there”, all using absolute coordinates.
 * Shape has no idea where it will be used or how big it will be used, but instead will be asked to draw itself inside a given rectangle.
 
 * Difference between Path and Shape is reusability :
 -> Paths are designed to do one specific thing
 -> Shapes have the flexibility of drawing space and can also accept parameters to let us customize them further.
 */

import SwiftUI

// Allow the path to take all the space available
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

struct Arc: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool

    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment

        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)

        return path
    }
}

struct PathvsShape: View {
    var body: some View {
        /*Triangle()
            .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            .frame(width: 300, height: 300)*/
        Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
            .stroke(.blue, lineWidth: 10)
            .frame(width: 300, height: 300)    }
}

struct PathvsShape_Previews: PreviewProvider {
    static var previews: some View {
        PathvsShape()
    }
}
