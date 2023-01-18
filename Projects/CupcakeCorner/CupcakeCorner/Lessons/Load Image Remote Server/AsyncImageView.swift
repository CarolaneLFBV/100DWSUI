//
//  AsyncImageView.swift
//  CupcakeCorner
//
//  Created by Carolane LEFEBVRE on 16/01/2023.
//

import SwiftUI

struct AsyncImageView: View {
    var body: some View {
        
        /*
         * url: img from remote server
         * placeholder: in case the img wouldn't load
         */
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("There was an error loading the image.")
            } else {
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView()
    }
}
