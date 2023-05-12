//
//  TimeConverter.swift
//  WeSplit
//
//  Created by Carolane LEFEBVRE on 06/04/2023.
//

import SwiftUI

struct TimeConverter: View {
    @State private var inputTime = 0.0
    @State private var inputUnits = "Seconds"
    @State private var outputUnits = "Seconds"
    let time = ["Seconds", "Minutes", "Hours", "Days"]
    
    @FocusState private var inputTimeFocused
    
    var outputTime: Double {
        var timeInSeconds = 0.0
        
        if inputUnits == "Minutes" {
            timeInSeconds = inputTime * 60
        }
        else if inputUnits == "Hours" {
            timeInSeconds = inputTime * 3600
        }
        else if inputUnits == "Days" {
            timeInSeconds = inputTime * 86400
        }
        else {
            timeInSeconds = inputTime
        }
        
        if outputUnits == "Minutes" {
            return timeInSeconds / 60
        }
        else if outputUnits == "Hours" {
            return timeInSeconds / 3600
        }
        else if outputUnits == "Days" {
            return timeInSeconds / 86400
        }
        else {
            return timeInSeconds
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section("Input") {
                    TextField("Time in \(inputUnits)", value: $inputTime, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputTimeFocused)
                    
                    Picker("Units", selection: $inputUnits) {
                        ForEach(time, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                Section("Output") {
                    Text(outputTime, format: .number)
                        .keyboardType(.decimalPad)
                    
                    Picker("Units", selection: $outputUnits) {
                        ForEach(time, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
            }
            .navigationTitle("Time Converter")
        }
    }
}

struct TimeConverter_Previews: PreviewProvider {
    static var previews: some View {
        TimeConverter()
    }
}
