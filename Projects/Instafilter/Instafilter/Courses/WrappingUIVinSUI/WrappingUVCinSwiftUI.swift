//
//  WrappingUVCinSwiftUI.swift
//  Instafilter
//
//  Created by Carolane LEFEBVRE on 08/08/2023.
//

import SwiftUI

struct WrappingUVCinSwiftUI: View {
    @State private var image: Image?
    @State private var showingImagePicker = false
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            
            Button("Select Image") {
                showingImagePicker = true
            }
        }
        /*.sheet(isPresented: $showingImagePicker) {
            ImagePicker()
        }*/
    }
}

struct WrappingUVCinSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        WrappingUVCinSwiftUI()
    }
}
