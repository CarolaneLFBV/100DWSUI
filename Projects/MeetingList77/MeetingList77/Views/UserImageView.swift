    //
    //  UserImageView.swift
    //  MeetingList77
    //
    //  Created by Carolane LEFEBVRE on 04/03/2023.
    //

import SwiftUI

struct UserImageView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.images) { userImage in
                Image(uiImage: userImage.image)
                    .resizable()
                    .scaledToFit()
            }
            .onChange(of: viewModel.inputImage) { _ in viewModel.converToSwiftUiImage() }
        }
    }
}

struct UserImageView_Previews: PreviewProvider {
    static var previews: some View {
        UserImageView()
    }
}
