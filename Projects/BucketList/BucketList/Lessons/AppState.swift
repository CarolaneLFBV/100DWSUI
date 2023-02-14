//
//  AppState.swift
//  BucketList
//
//  Created by Carolane LEFEBVRE on 07/02/2023.
//

import SwiftUI

enum LoadingAppState {
    case loading, success, failed
}

struct LoadingAppView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessAppView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedAppView: View {
    var body: some View {
        Text("Failed.")
    }
}
