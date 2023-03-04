//
//  UserImageViewModel.swift
//  MeetingList77
//
//  Created by Carolane LEFEBVRE on 04/03/2023.
//

import SwiftUI

extension UserImageView {
    @MainActor class ViewModel: ObservableObject {
        @Published private(set) var images: [UserImage]

        @Published var showingImagePicker = false
        @Published var showingAddImageDetails = false

        @Published var inputImage: UIImage?
        @Published var image: Image?

        let savePath = FileManager.documentsDirectory.appendingPathComponent("ImageContext")

        init() {
            do {
                let data = try Data(contentsOf: savePath)
                images = try JSONDecoder().decode([UserImage].self, from: data)
            } catch {
                images = []
            }
        }

        func save() {
            do {
                let data = try JSONEncoder().encode(images)
                try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }

        func converToSwiftUiImage() {
            guard let inputImage = inputImage else { return }
            let outputImage = Image(uiImage: inputImage)

            image = outputImage
            updateImages()
        }


        func updateImages() {
            guard let inputImage = inputImage else { return }
            let newUserImage = UserImage(id: UUID(), name: "New Image", image: inputImage)

            images.append(newUserImage)
            save()
        }
    }
}
