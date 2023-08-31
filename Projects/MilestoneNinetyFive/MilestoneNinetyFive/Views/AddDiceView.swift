//
//  AddDiceView.swift
//  MilestoneNinetyFive
//
//  Created by Carolane Lefebvre on 31/08/2023.
//

import SwiftUI
import CoreHaptics

struct AddDiceView: View {
    @ObservedObject var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var side = 4
    @State private var sides = [4, 6, 8, 10, 12, 20, 100]
    
    @State private var showingDiceResult = false
    @State private var rolledTheDice = false
    
    @State private var engine: CHHapticEngine?
    
    var resultDice: Int {
        let random = Int.random(in: 4...side)
        return random
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Dice informations") {
                    TextField("Name of the dice", text: $name)
                        
                    Picker("Select a side", selection: $side) {
                        ForEach(sides, id: \.self) { index in
                            Text("\(index)")
                        }
                    }
                    .pickerStyle(.automatic)
                    .onChange(of: side, perform: { (value) in
                        showingDiceResult = false
                    })
                }
                
                Button("Roll the dice") {
                    showingDiceResult = true
                    complexHapticBtn()
                }
                .disabled(name.isEmpty)
                
                if showingDiceResult {
                    Section {
                        Text("Result: \(resultDice)")
                            .bold()
                            .foregroundColor(.blue)
                    }
                }
            }
            .onAppear(perform: prepareHaptics)
            .navigationTitle("New Dice")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save", action: addNewDice)
                        .disabled(name.isEmpty)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
            }
        }
    }

    func addNewDice() {
        viewModel.addDice(name: name, side: side, result: resultDice)
        viewModel.updateDice()
        dismiss()
    }
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func complexHapticBtn() {
        // make sure that the device supports haptics
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()
        
        // create one intense, sharp tap
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        events.append(event)
        
        // convert those events into a pattern and play it immediately
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Error pattern: \(error.localizedDescription)")
        }
    }
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
}
