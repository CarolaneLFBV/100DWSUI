//
//  ScrollViewAndData.swift
//  Moonshot
//
//  Created by Carolane LEFEBVRE on 01/12/2022.
//

import SwiftUI

struct CustomText: View {
    let text: String

    var body: some View {
        Text(text)
    }

    init(_ text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}

struct ScrollViewAndData: View {
    var body: some View {
        /* Vertical Scrolling
         
         ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
         */
        
        // Horizontal scrolling
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
        }
    }
}

struct ScrollViewAndData_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewAndData()
    }
}
