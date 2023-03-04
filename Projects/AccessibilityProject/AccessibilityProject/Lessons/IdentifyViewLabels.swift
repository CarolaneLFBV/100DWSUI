    //
    //  IdentifyViewLabels.swift
    //  AccessibilityProject
    //
    //  Created by Carolane LEFEBVRE on 16/02/2023.
    //

import SwiftUI

struct IdentifyViewLabels: View {
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]
    
    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks",
    ]
    
    @State private var selectedPicture = Int.random(in: 0...3)
    
    var body: some View {
        Image(pictures[selectedPicture])
            .resizable()
            .scaledToFit()
            .onTapGesture {
                selectedPicture = Int.random(in: 0...3)
            }
            .accessibilityLabel(labels[selectedPicture])
        
    }
}

struct IdentifyViewLabels_Previews: PreviewProvider {
    static var previews: some View {
        IdentifyViewLabels()
    }
}
