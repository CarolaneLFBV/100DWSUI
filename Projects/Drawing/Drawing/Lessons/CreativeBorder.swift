//
//  CreativeBorder.swift
//  Drawing
//
//  Created by Carolane LEFEBVRE on 16/12/2022.
//

import SwiftUI

struct CreativeBorder: View {
    var body: some View {
        Text("Hello World")
            .frame(width: 300, height: 300)
            .border(ImagePaint(image: Image("Exemple"), scale: 0.2), width: 30)
        
        Capsule()
            .strokeBorder(ImagePaint(image: Image("Exemple"), scale: 0.1), lineWidth: 20)
            .frame(width: 300, height: 200)
    }
}

struct CreativeBorder_Previews: PreviewProvider {
    static var previews: some View {
        CreativeBorder()
    }
}
