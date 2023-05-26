//
//  CustomPath.swift
//  Drawing
//
//  Created by Carolane LEFEBVRE on 23/05/2023.
//

import SwiftUI

struct CustomPath: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
            //path.closeSubpath() - Closes subpath (1)
        }
        //.fill(.blue) - Fills with a color
        //.stroke(.blue, lineWidth: 10) - Only fills the borders, but doesn't close the subpath
        .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round)) // Can also do that way (1)



    }
}

struct CustomPath_Previews: PreviewProvider {
    static var previews: some View {
        CustomPath()
    }
}
