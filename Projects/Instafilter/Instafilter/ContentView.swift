//
//  ContentView.swift
//  Instafilter
//
//  Created by Carolane LEFEBVRE on 30/01/2023.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    @State private var image: Image?
    @State private var inputImage: UIImage?
    
    @State private var filterIntensity: Double = 0.5
    @State private var filterRadius: Double = 0.5
    @State private var filterScale: Double = 0.5
    
    @State private var showingImagePicker: Bool = false
    @State private var showingFilterSheet: Bool = false
    @State private var showingSuccessAlert: Bool = false
    @State private var showingNoImageAlert: Bool = false
    
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    let context = CIContext()
    
    @State private var processedImage: UIImage?
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(.secondary)
                    
                    if image != nil {
                        image?
                            .resizable()
                        .scaledToFit()
                    } else {
                        Text("Tap to select a picture")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                }
                .onTapGesture {
                    showingImagePicker = true
                }
                
                VStack {
                    HStack {
                        Text("Intensity")
                        Slider(value: $filterIntensity)
                            .onChange(of: filterIntensity) { _ in
                                applyProcessing()
                            }
                    }
                    
                    HStack {
                        Text("Radius")
                        Slider(value: $filterRadius)
                            .onChange(of: filterRadius) { _ in
                                applyProcessing()
                            }
                    }
                    
                    HStack {
                        Text("Scale")
                        Slider(value: $filterScale)
                            .onChange(of: filterScale) { _ in
                                applyProcessing()
                            }
                    }
                }
                .padding()

                
                HStack {
                    Button("Change Filter") {
                        showingFilterSheet = true
                    }
                    .alert(isPresented: $showingNoImageAlert) {
                        Alert(title: Text("No image!"), message: Text("You have to add a filter to generate an image in order to save it."), dismissButton: .default(Text("OK")))
                    }
                    
                    Spacer()
                    
                    Button("Save") {
                        guard let processedImage = processedImage else {
                            showingNoImageAlert = true
                            return
                        }
                        
                        let imageSaver = ImageSaver()
                        
                        imageSaver.successHandler = {
                            print("Success!")
                            showingSuccessAlert = true
                        }
                        
                        imageSaver.errorHandler = {
                            print("Oops! \($0.localizedDescription)")
                        }
                        
                        imageSaver.writeToPhotoAlbum(image: processedImage)
                    }
                    .alert(isPresented: $showingSuccessAlert) {
                        Alert(title: Text("Saved image!"), message: Text("Your processed image is now saved in your Photo Library."), dismissButton: .default(Text("Great!")))
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("InstaFilter")
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
            .confirmationDialog("Select a filter", isPresented: $showingFilterSheet) {
                Button("Crystallize") { setFilter(CIFilter.crystallize()) }
                Button("Edges") { setFilter(CIFilter.edges()) }
                Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur()) }
                Button("Pixellate") { setFilter(CIFilter.pixellate()) }
                Button("Sepia Tone") { setFilter(CIFilter.sepiaTone()) }
                Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask()) }
                Button("Vignette") { setFilter(CIFilter.vignette()) }
                Button("Cancel", role: .cancel) { }
            }
            .onChange(of: inputImage, perform: {_ in loadImage()})
        }
    }
    
    
    func save() {
        guard let processedImage = processedImage else { return }

        let imageSaver = ImageSaver()
        imageSaver.successHandler = { print("Success!") }

        imageSaver.errorHandler = { print("Oops: \($0.localizedDescription)") }

        imageSaver.writeToPhotoAlbum(image: processedImage)
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }

        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys

        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(filterRadius * 200, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterScale * 10, forKey: kCIInputScaleKey) }
        guard let outputImage = currentFilter.outputImage else { return }
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
            processedImage = uiImage
        }
    }
    
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
