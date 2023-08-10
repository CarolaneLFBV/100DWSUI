//
//  TouchAndFaceID.swift
//  BucketList
//
//  Created by Carolane LEFEBVRE on 10/08/2023.
//

import SwiftUI
import LocalAuthentication

struct TouchAndFaceID: View {
    @State private var isUnlocked = false
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate() {
        // Create instance of LAContext: allows to use query biometric status and perform authentication check
        let context = LAContext()
        var error: NSError?
        
        // check whether biometric authentifcation is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // possible, so use it
            let reason = "We need to unlock your data"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication completed
                if success {
                    isUnlocked = true
                } else {
                    // fail
                }
            }
        } else {
            // No biometrics
        }
    }
}

struct TouchAndFaceID_Previews: PreviewProvider {
    static var previews: some View {
        TouchAndFaceID()
    }
}
