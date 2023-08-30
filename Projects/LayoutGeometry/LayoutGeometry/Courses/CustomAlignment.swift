//
//  CustomAlignment.swift
//  LayoutGeometry
//
//  Created by Carolane Lefebvre on 30/08/2023.
//

import SwiftUI

extension VerticalAlignment {
    struct MidAccountAndName: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.top]
        }
    }
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct CustomAlignment: View {
    var body: some View {
        HStack {
            VStack{
                Text("@hokiip")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center]}
                Image("alpe-dhuez")
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            
            VStack {
                Text("Full name:")
                Text("ALPE HUEZ")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center]}
                    .font(.largeTitle)
                Text("testr")
            }
        }
    }
}

struct CustomAlignment_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlignment()
    }
}
