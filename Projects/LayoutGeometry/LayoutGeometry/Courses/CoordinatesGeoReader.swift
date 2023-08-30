//
//  CoordinatesGeoReader.swift
//  LayoutGeometry
//
//  Created by Carolane Lefebvre on 30/08/2023.
//

import SwiftUI

struct CoordinatesGeoReader: View {
    var body: some View {
        VStack {
            GeometryReader { geo in
                Text("Hello, World!")
                    .frame(width: geo.size.width * 0.9, height: 40)
                    .background(.red)
            }
            .background(.green)
            
            Text("More text")
                .background(.blue)
        }
    }
}

struct CoordinatesGeoReader_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatesGeoReader()
    }
}
