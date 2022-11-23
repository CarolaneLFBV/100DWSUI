//
//  ContentView.swift
//  BetterRest
//
//  Created by Carolane LEFEBVRE on 23/11/2022.
//

import SwiftUI
import CoreML

struct ContentView: View {
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    @State private var sleepAmount: Double = 8.0
    @State private var wakeUp = defaultWakeTime
    @State private var coffeeAmount: Int = 0
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    

    func calculateBedTime() -> String {
            let config = MLModelConfiguration()
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60

            do {
                let model = try BetterRest(configuration: config)
                let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
                let sleepTime = wakeUp - prediction.actualSleep

                let formatter = DateFormatter()
                formatter.timeStyle = .short

                return formatter.string(from: sleepTime)
            } catch {
                return "Sorry, there was a problem calculating your bedtime."
            }
      }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("When do you want to wake up?"){
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                }
                    
                Section("Desired amount of sleep") {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                    
                Section("Daily coffee intake") {
                    Picker("Coffee Amount", selection: $coffeeAmount) {
                        ForEach(0 ..< 11) {
                            Text("\($0) cups")
                        }
                    }
                }
                
                Section(header: Text("Your recommended bed time is...")) {
                    Text(calculateBedTime())
                        .font(.largeTitle)
                        .foregroundColor(Color(UIColor.systemBlue))
                }
                
            }
            .navigationTitle("BetterRest")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
