//
//  ImagePaintTuto.swift
//  Drawing
//
//  Created by Carolane LEFEBVRE on 23/05/2023.
//

import SwiftUI

struct ImagePaintTuto: View {
    var body: some View {
        Capsule()
            .strokeBorder(ImagePaint(image: Image(systemName: "gear"), scale: 0.1), lineWidth: 20)
            .frame(width: 300, height: 200)
    }
}

struct ImagePaintTuto_Previews: PreviewProvider {
    static var previews: some View {
        ImagePaintTuto()
    }
}
