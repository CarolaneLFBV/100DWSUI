//
//  TriggerTime.swift
//  Flashzilla
//
//  Created by Carolane Lefebvre on 22/08/2023.
//

import SwiftUI

struct TriggerTimer: View {
    // Asks the timer to fire every 1 second
    // It says the timer should run on the main thread
    // The timer should run on the common run loop: the one you'll want ot use most of the time
    // Connects the timer immediately, which means it will start couting time
    // Assigns the whole thing to the timer constant so that it stays alive
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .onReceive(timer) { time in
                    print("\(time)")
                }
            
            Button("Stop Timer") {
                timer.upstream.connect().cancel()
            }
        }
    }
}


struct onReceiveCounter: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .onReceive(timer) { time in
                    if counter == 5 {
                        timer.upstream.connect().cancel()
                    } else {
                        print("\(time)")
                    }
                    
                    counter += 1
                }
        }
    }
}

struct TriggerTimer_Previews: PreviewProvider {
    static var previews: some View {
        onReceiveCounter()
    }
}
