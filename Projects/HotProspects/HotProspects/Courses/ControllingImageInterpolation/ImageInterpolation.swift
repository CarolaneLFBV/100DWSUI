//
//  ImageInterpolation.swift
//  HotProspects
//
//  Created by Carolane LEFEBVRE on 17/08/2023.
//

import SwiftUI

struct ImageInterpolation: View {
    var body: some View {
        Image("example")
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: .infinity)
            .background(.black)
            .ignoresSafeArea()
    }
}

struct ImageInterpolation_Previews: PreviewProvider {
    static var previews: some View {
        ImageInterpolation()
    }
}
