//
//  ContentView.swift
//  BetterRest
//
//  Created by Carolane LEFEBVRE on 20/04/2023.
//

import SwiftUI
import CoreML

struct ContentView: View {
    // CoreML variables
    @State private var sleepAmount: Double = 8.0
    @State private var wakeUp = defaultWakeTime
    @State private var coffeeAmount: Int = 1
    
    // Alert
    @State private var isPresented: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    
                    DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                Section {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                Section {
                    Text("Amount of coffee")
                        .font(.headline)
                    
                   //Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
                    
                    Picker("Coffee Amount", selection: $coffeeAmount) {
                        ForEach (1..<21) {
                            Text("\($0) \($0 == 1 ? "cup" : "cups")")
                        }
                    }
                }
                
                Section {
                    Text("Recommended Bedtime")
                        .font(.headline)
                    
                    Text("\(sleepAmount.formatted()) hours")
                        .foregroundColor(sleepAmount <= 5 ? .red : .green)
                }
            }
            .navigationTitle("BetterRest")
            /*.toolbar {
                Button("Calculate", action: calculateBedTime)
            }*/
            .alert(alertTitle, isPresented: $isPresented) {
                Button("OK") {}
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    func calculateBedTime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 3600
            let minute = (components.minute ?? 0) * 60
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "Your ideal bedtime is.."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "Something went wrong, please try again"
        }
        isPresented = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
