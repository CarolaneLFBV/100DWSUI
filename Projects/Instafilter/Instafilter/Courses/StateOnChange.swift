//
//  StateOnChange.swift
//  Instafilter
//
//  Created by Carolane LEFEBVRE on 08/08/2023.
//

import SwiftUI

struct StateOnChange: View {
    @State private var blurAmount: CGFloat = 0.0 {
        didSet {
            print("New value is \(blurAmount)")
        }
    }
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .blur(radius: blurAmount)
            
            Slider(value: $blurAmount, in: 0...20)
                .onChange(of: blurAmount) { newValue in
                    print("New value is \(newValue)")
                }
        }
    }
}

struct StateOnChange_Previews: PreviewProvider {
    static var previews: some View {
        StateOnChange()
    }
}
