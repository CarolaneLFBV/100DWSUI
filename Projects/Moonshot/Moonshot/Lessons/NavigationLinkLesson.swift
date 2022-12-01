//
//  NavigationLinkLesson.swift
//  Moonshot
//
//  Created by Carolane LEFEBVRE on 01/12/2022.
//

import SwiftUI

struct NavigationLinkLesson: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { row in
                NavigationLink {
                    Text("Detail \(row)")
                } label: {
                    Text("Row \(row)")
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

struct NavigationLinkLesson_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLinkLesson()
    }
}
