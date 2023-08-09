//
//  CoordinatorsSUIControllers.swift
//  Instafilter
//
//  Created by Carolane LEFEBVRE on 08/08/2023.
//

import SwiftUI

struct CoordinatorsSUIControllers: View {
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var showingImagePicker = false
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            
            Button("Select Image") {
                showingImagePicker = true
            }
            
            Button("Save Image") {
                guard let inputImage = inputImage else { return }
                
                let imageSaver = ImageSaver()
                imageSaver.writeToPhotoAlbum(image: inputImage)
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
        .onChange(of: inputImage) { _ in loadImage() }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        
        // the 3 nil params matter. They tell Swift what method should be called when saivng completes, which in turn will tell us whether the save operation succeeded or failed.
        UIImageWriteToSavedPhotosAlbum(inputImage, nil, nil, nil)
    }
}

struct CoordinatorsSUIControllers_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatorsSUIControllers()
    }
}
