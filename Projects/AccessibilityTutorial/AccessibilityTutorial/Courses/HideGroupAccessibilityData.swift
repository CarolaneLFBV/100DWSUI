//
//  HideGroupAccessibilityData.swift
//  AccessibilityTutorial
//
//  Created by Carolane LEFEBVRE on 11/08/2023.
//

import SwiftUI

struct HideGroupAccessibilityData: View {
    var body: some View {
        VStack {
            Text("Your score is")
            Text("1000")
                .font(.title)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Your score is 1000")
    }
}

struct HideGroupAccessibilityData_Previews: PreviewProvider {
    static var previews: some View {
        HideGroupAccessibilityData()
    }
}
