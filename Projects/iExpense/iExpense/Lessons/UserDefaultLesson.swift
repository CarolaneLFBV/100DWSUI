//
//  UserDefaults.swift
//  iExpense
//
//  Created by Carolane LEFEBVRE on 01/12/2022.
//

import SwiftUI

struct UserDefaultsLesson: View {
    // Works the same as UserDefaults. The string represents the key to store data
    @AppStorage("tapCount") private var tapCount = 0

    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
        }
    }
}

struct UserDefaultsLesson_Previews: PreviewProvider {
    static var previews: some View {
        UserDefaultsLesson()
    }
}
