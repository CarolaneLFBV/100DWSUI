//
//  TwoSideViews.swift
//  SnowSeeker
//
//  Created by Carolane Lefebvre on 01/09/2023.
//

import SwiftUI

struct TwoSideViews: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                Text("New secondary")
            } label: {
                Text("Hello, World!")
            }
            .navigationTitle("Primary")
            
            Text("Secondary")
        }
    }
}

struct TwoSideViews_Previews: PreviewProvider {
    static var previews: some View {
        TwoSideViews()
    }
}
