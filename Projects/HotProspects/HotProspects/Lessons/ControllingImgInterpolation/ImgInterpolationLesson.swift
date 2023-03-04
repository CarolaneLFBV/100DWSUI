//
//  ImgInterpolationLesson.swift
//  HotProspects
//
//  Created by Carolane LEFEBVRE on 04/03/2023.
//

import SwiftUI

struct ImgInterpolationLesson: View {
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

struct ImgInterpolationLesson_Previews: PreviewProvider {
    static var previews: some View {
        ImgInterpolationLesson()
    }
}
