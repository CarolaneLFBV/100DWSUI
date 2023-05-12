//
//  Tutorials.swift
//  BetterRest
//
//  Created by Carolane LEFEBVRE on 20/04/2023.
//

import SwiftUI

struct Tutorials: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    
    var body: some View {
        VStack {
            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12,step: 0.25)
            //DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
            DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
                .labelsHidden()
        }
        .padding()
    }
    
    /*func examplesDate() {
        let tomorrow = Date.now.addingTimeInterval(86400)
        let range = Date.now...tomorrow
    }*/
}

struct Tutorials_Previews: PreviewProvider {
    static var previews: some View {
        Tutorials()
    }
}
