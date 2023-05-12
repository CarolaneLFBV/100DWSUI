    //
    //  ContentView.swift
    //  ProjectThirtyFive
    //
    //  Created by Carolane LEFEBVRE on 11/05/2023.
    //

import SwiftUI

struct ContentView: View {
        // Tables
    @State private var selectedTable = 2
    @State private var randomNumber = Int.random(in: 2...12)
    
    var correctAnswer: Int {
        return selectedTable * randomNumber
    }
        
        // Rounds
    @State private var roundsOptions = [2, 5, 10, 20]
    @State private var selectedRound = 5
    @State private var rounds = 0
    
        // Texts
    @State private var answer = 0
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    
    @State private var showingEnd = false
    @State private var score = 0
    
    @State private var showingAlert = false
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.orange, .red]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    VStack {
                        Text("Multiplication table")
                            .bold()
                        
                        Picker("", selection: $selectedTable) {
                            ForEach(2..<13) { table in
                                Text("\(table - 2)")
                            }
                        }
                    }
                    .roundBackground()

                    
                    Spacer()
                    
                    VStack(alignment: .center) {
                        Text("\(selectedTable) * \(randomNumber) = ?")
                        
                        TextField("Answer", value: $answer, format: .number)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.center)
                            .frame(width: 100)
                            .onSubmit {
                                verifyQuestion()
                            }
                    }
                    .font(.title)
                    .foregroundColor(.white)
                    
                    
                    HStack {
                        Text("Score: \(score)/\(selectedRound)")
                        Text("Rounds: \(rounds)/\(selectedRound)")
                    }
                    
                    Spacer()

                    VStack {
                        Text("Rounds")
                            .bold()

                        Picker("Rounds", selection: $selectedRound) {
                            ForEach(roundsOptions, id: \.self) { round in
                                Text("\(round)")
                            }
                        }
                    }
                    .pickerStyle(.segmented)
                    .roundBackground()

                }
                .navigationTitle("Let's play!")
            }
        }
        .alert(scoreTitle, isPresented: $showingAlert) {
            Button("Next", action: askQuestion)
            Button("Restart", action: restartGame)
        } message: {
            Text(scoreMessage)
        }
        .alert(scoreTitle, isPresented: $showingEnd) {
            Button("Restart", action: restartGame)
        } message: {
            Text(scoreMessage)
        }
    }
    
    func verifyQuestion(){
        if answer == correctAnswer {
            scoreTitle = "Correct!"
            scoreMessage = "Keep going!"
            score += 1
        } else {
            scoreTitle = "Wrong!"
            scoreMessage = "Try again!"
        }
        showingAlert = true
        
    }
    
    func askQuestion() {
        rounds += 1
        answer = 0
        randomNumber = Int.random(in: 2...12)
        
        if rounds == selectedRound {
            showingEnd = true
            scoreTitle = "End of the game!"
            scoreMessage = "Your score is: \(score)/\(rounds)"
            
        }
    }
    
    func restartGame() {
        score = 0
        rounds = 0
        selectedTable = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
