//
//  AbsolutePositioning.swift
//  LayoutGeometry
//
//  Created by Carolane Lefebvre on 30/08/2023.
//

import SwiftUI

struct AbsolutePositioning: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .position(x: 100, y: 100)
            .background(.red)
            .offset(x: 100, y: 100)
    }
}

struct AbsolutePositioning_Previews: PreviewProvider {
    static var previews: some View {
        AbsolutePositioning()
    }
}
