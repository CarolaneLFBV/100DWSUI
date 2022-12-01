//
//  ResizeImage.swift
//  Moonshot
//
//  Created by Carolane LEFEBVRE on 01/12/2022.
//

import SwiftUI

struct ResizeImage: View {
    var body: some View {
        GeometryReader { geo in
            Image("aldrin")
                .resizable()
                .scaledToFit()
                .frame(width: geo.size.width * 0.8)
                .frame(width: geo.size.width, height: geo.size.height)
                // add this frame to center the image
        }
    }
}

struct ResizeImage_Previews: PreviewProvider {
    static var previews: some View {
        ResizeImage()
    }
}
