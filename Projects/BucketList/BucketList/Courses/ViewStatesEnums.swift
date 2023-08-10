//
//  ViewStatesEnums.swift
//  BucketList
//
//  Created by Carolane LEFEBVRE on 10/08/2023.
//

import SwiftUI

enum LoadingState {
    case loading, success, failed
}

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}

struct ViewStatesEnums: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ViewStatesEnums_Previews: PreviewProvider {
    static var previews: some View {
        ViewStatesEnums()
    }
}
