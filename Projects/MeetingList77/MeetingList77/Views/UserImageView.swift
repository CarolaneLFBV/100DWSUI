    //
    //  UserImageView.swift
    //  MeetingList77
    //
    //  Created by Carolane LEFEBVRE on 04/03/2023.
    //

import SwiftUI

struct UserImageView: View {    
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var currentImg: UIImage?
    
    @State private var savedPictures: [String] = UserDefaults.standard.object(forKey: "savedPictures") as? [String] ?? [String]()
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        
        currentImg = inputImage
    }
    
    var body: some View {
        Section (header: Text("Insertion d'image")) {
            VStack {
                ZStack {
                    
                    Text("Ajouter une image")
                        .foregroundColor(.orange)
                        .font(.system(size: 15, weight: .bold))
                    
                    image?
                        .resizable()
                        .scaledToFit()
                }
                .onTapGesture {
                    showingImagePicker = true
                }
            }
        }
        .font(.system(size: 13, weight: .bold))
    }
}

struct UserImageView_Previews: PreviewProvider {
    static var previews: some View {
        UserImageView()
    }
}
