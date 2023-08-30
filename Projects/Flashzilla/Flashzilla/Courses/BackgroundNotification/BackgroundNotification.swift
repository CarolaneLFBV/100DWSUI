//
//  BackgroundNotification.swift
//  Flashzilla
//
//  Created by Carolane Lefebvre on 22/08/2023.
//

import SwiftUI

struct BackgroundNotification: View {
    // Adding a new property to watch an environment value (scenePhase)
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        Text("Hello, world! :)")
            .padding()
            .onChange(of: scenePhase) { newPhase in     // Using onChange to watch for the scene phase changing
                if newPhase == .active {
                    // respond to the new scene phase somehow
                    print("Active")
                } else if newPhase == .inactive {
                    print("Inactive")
                } else if newPhase == .background {
                    print("Background")
                }
            }
    }
}

struct BackgroundNotification_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundNotification()
    }
}
