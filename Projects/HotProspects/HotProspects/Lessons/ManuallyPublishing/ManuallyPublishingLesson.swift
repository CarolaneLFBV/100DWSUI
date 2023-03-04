//
//  ManuallyPublishingLesson.swift
//  HotProspects
//
//  Created by Carolane LEFEBVRE on 04/03/2023.
//

import SwiftUI

@MainActor class DelayedUpdater: ObservableObject {
    var value = 0 {
        willSet {
            objectWillChange.send()
        }
    }
    
    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}

struct ManuallyPublishingLesson: View {
    @StateObject var updater = DelayedUpdater()

    var body: some View {
        Text("Value is: \(updater.value)")
    }
}


struct ManuallyPublishingLesson_Previews: PreviewProvider {
    static var previews: some View {
        ManuallyPublishingLesson()
    }
}
