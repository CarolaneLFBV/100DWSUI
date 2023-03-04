//
//  ContentViewLessons.swift
//  HotProspects
//
//  Created by Carolane LEFEBVRE on 04/03/2023.
//

import SwiftUI

struct ContentViewLessons: View {
    @StateObject private var user = User()

    var body: some View {
        VStack {
            EditView()
            DisplayView()
        }
        .environmentObject(user)
    }
}

struct ContentViewLessons_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewLessons()
    }
}
