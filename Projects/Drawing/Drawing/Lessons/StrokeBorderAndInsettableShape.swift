//
//  StrokeBorderAndInsettableShape.swift
//  Drawing
//
//  Created by Carolane LEFEBVRE on 02/12/2022.
//

import SwiftUI

struct Arc2: InsettableShape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    
    var insetAmount: Double = 0.0
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }

    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment

        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)

        return path
    }
}

struct StrokeBorderAndInsettableShape: View {
    var body: some View {
        /*Circle()
            .strokeBorder(.blue, lineWidth: 40)*/
        Arc2(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
            .strokeBorder(.blue, lineWidth: 40)
    }
}

struct StrokeBorderAndInsettableShape_Previews: PreviewProvider {
    static var previews: some View {
        StrokeBorderAndInsettableShape()
    }
}
