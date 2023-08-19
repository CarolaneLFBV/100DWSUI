//
//  CustomRowSwipe.swift
//  HotProspects
//
//  Created by Carolane LEFEBVRE on 17/08/2023.
//

import SwiftUI

struct CustomRowSwipe: View {
    var body: some View {
        List {
            Text("Taylor Swift")
                .swipeActions {
                    Button {
                        print("Hi")
                    } label: {
                        Label("Delete", systemImage: "minus.circle")
                    }
                }
                .swipeActions(edge: .leading) {
                    Button {
                        print("Hi")
                    } label: {
                        Label("Pin", systemImage: "pin")
                    }
                    .tint(.orange)
                }
        }
    }
}

struct CustomRowSwipe_Previews: PreviewProvider {
    static var previews: some View {
        CustomRowSwipe()
    }
}
