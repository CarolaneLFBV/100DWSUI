//
//  ContentView.swift
//  Instafilter
//
//  Created by Carolane LEFEBVRE on 30/01/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    @State private var showingImagePicker: Bool = false
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            
            Button("Select Image") {
                showingImagePicker = true
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
