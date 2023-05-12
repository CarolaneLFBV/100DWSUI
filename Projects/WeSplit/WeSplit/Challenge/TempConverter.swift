    //
    //  TempConverter.swift
    //  WeSplit
    //
    //  Created by Carolane LEFEBVRE on 06/04/2023.
    //

import SwiftUI

struct TempConverter: View {
    @State private var inputTemperature = 0.0
    @State private var inputUnits = "Celsius"
    @State private var outputUnits = "Celsius"
    let temperatures = ["Celsius", "Kelvin", "Fahrenheit"]
    
    var outputTemperature: Double {
        var temperatureInCelsius = 0.0
        
        // from Fahrenheit
        if inputUnits == "Fahrenheit" {
            temperatureInCelsius = (inputTemperature - 32) * 5/9
        }
        // from Kelvin
        else if inputUnits == "Kelvin" {
            temperatureInCelsius = inputTemperature - 273.15
        }
        // from Celsius
        else {
            temperatureInCelsius = inputTemperature
        }
        
        // to Fahrenheit
        if outputUnits == "Fahrenheit" {
            return temperatureInCelsius * 9/5 + 32
        }
        // to Kelvin
        else if outputUnits == "Kelvin" {
            return temperatureInCelsius + 273.15
        }
        // to Celsius
        else {
            return temperatureInCelsius
        }
        
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Units", selection: $inputUnits){
                        ForEach(temperatures,id:\.self){
                            Text("º\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("units")
                }
                Section {
                    TextField("Temperature in \(inputUnits)º", value: $inputTemperature, format: .number)
                        .keyboardType(.decimalPad)
                        //.focused($inputTemperatureFocused)
                }
                Section {
                    Picker("Units", selection: $outputUnits){
                        ForEach(temperatures,id:\.self){
                            Text("º\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Convert to")
                }
                Section {
                    Text(outputTemperature, format: .number)
                }
            }
            /*.toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done"){
                        inputTemperatureFocused = false
                    }
                }
            }*/
            .navigationTitle("TempConvert") // Title to our form.
        }
    }
}

struct TempConverter_Previews: PreviewProvider {
    static var previews: some View {
        TempConverter()
    }
}
