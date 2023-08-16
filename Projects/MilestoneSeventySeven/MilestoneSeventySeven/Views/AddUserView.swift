//
//  EditView.swift
//  MilestoneSeventySeven
//
//  Created by Carolane LEFEBVRE on 12/08/2023.
//

import SwiftUI

struct AddUserView: View {
    @ObservedObject var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var description = ""
    
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var savingImage: UIImage?
    
    @State private var showingImagePicker = false
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
                
                Spacer()
                
                ZStack {
                    Text("Tap here to select a photo")
                    
                    image?
                        .resizable()
                        .scaledToFit()
                }
                .onTapGesture {
                    showingImagePicker = true
                }
                
                Spacer()
            }
            .padding([.horizontal, .vertical])
            .onChange(of: inputImage) { _ in loadImage()}
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
            .navigationTitle("Add a New User")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save", action: addNewUser)
                        .disabled(inputImage == nil)
                        .disabled(name.isEmpty)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
            }
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        savingImage = inputImage
    }
    
    func addNewUser() {
        viewModel.addUser(name: name, description: description, inputImage: savingImage)
        viewModel.updateUser()
        dismiss()
        
    }
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
}

