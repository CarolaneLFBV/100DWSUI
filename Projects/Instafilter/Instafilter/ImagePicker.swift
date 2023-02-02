//
//  ImagePicker.swift
//  Instafilter
//
//  Created by Carolane LEFEBVRE on 31/01/2023.
//

import SwiftUI
import PhotosUI

struct ImagePicker: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        
        let picker = PHPickerViewController(configuration: config)
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) { }
    
    typealias UIViewControllerType = PHPickerViewController
}

//MARK: - Coordinator class
class Coordinator {
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
}

