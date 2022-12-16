//
//  CustomPath.swift
//  Drawing
//
//  Created by Carolane LEFEBVRE on 02/12/2022.
//

import SwiftUI

struct CustomPath: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
            path.closeSubpath()
        }
        //.fill(.blue)
        //.stroke(.red, lineWidth: 10)
        // Gives control over how every line should be connected to the line after it && how every line should be drawn when it ends without a connection after it.
        .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
    }
}

struct CustomPath_Previews: PreviewProvider {
    static var previews: some View {
        CustomPath()
    }
}
