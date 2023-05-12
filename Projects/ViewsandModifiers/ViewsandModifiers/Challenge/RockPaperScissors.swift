    //
    //  RockPaperScissors.swift
    //  ViewsAndModifiers
    //
    //  Created by Carolane LEFEBVRE on 20/04/2023.
    //

import SwiftUI

struct RockPaperScissors: View {
    @State private var choices = ["🪨", "📄", "✂️"].shuffled()
    @State private var roundsNumber = [5, 10, 15]
    @State private var selectedRound = 5
    
    let computerChoice = Int.random(in: 0...2)
    @State private var winOrLoose = Bool.random()
    
    @State private var rounds = 0
    @State private var score = 0
    @State private var scoreTitle = ""
    
    @State private var showingAlert = false
    @State private var hasEnded = false
    @State private var correctAnswer = false
    
    var toWin: String {
        if choices[computerChoice] == "🪨" {
            return "📄"
        }
        else if choices[computerChoice] == "📄" {
            return "✂️"
        }
        else if choices[computerChoice] == "✂️" {
            return "🪨"
        }
        return ""
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [ .indigo, .purple, .yellow]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                VStack {
                    Text("Rock Paper Scissors")
                        .padding(.bottom, 10)
                        .font(.title)
                        .bold()
                    
                    
                    Text("The computer chooses... \(choices[computerChoice])!")
                        .font(.title2)
                    
                    HStack {
                        Text("You must...")
                            .font(.title2)
                        
                        Text(winOrLoose == true ? "WIN!" : "LOOSE!")
                            .font(.title)
                            .foregroundColor(winOrLoose == true ? .green : .red)
                            .bold()
                    }
                    
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button("🪨") {
                        let userAnswer = "🪨"
                        chosen(user: userAnswer)
                    }
                    .buttonStyle()
                    
                    Spacer()
                    
                    Button("📄") {
                        let userAnswer = "📄"
                        chosen(user: userAnswer)
                    }
                    .buttonStyle()

                    Spacer()
                    
                    Button("✂️") {
                        let userAnswer = "✂️"
                        chosen(user: userAnswer)
                    }
                    .buttonStyle()

                    Spacer()
                }
                
                Spacer()
                
                VStack {
                    Text("Score: \(score)/\(selectedRound)")
                        .font(.title)
                        .bold()
                    
                    HStack {
                        Text("Pick a number of rounds: ")
                            .font(.caption)
                        
                        Picker("Pick a number of rounds", selection: $selectedRound) {
                            ForEach(roundsNumber, id: \.self) {
                                Text($0, format: .number)
                            }
                            .font(.caption)
                        }
                    }
                    .buttonStyle()
                }
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingAlert) {
            Button("Next", action: askQuestion)
        } message: {
            if correctAnswer == true {
                Text("Your score is \(score)")
            } else {
                Text("Try again")
            }
        } .alert("Game Over", isPresented: $hasEnded) {
            Button("Restart game", action: restartGame)
        } message: {
            if correctAnswer == true {
                Text("Correct! Your final score was \(score)")
            } else {
                Text("Wrong! Your final score was \(score)")
            }
        }
    }
    
    func chosen(user: String) {
        rounds += 1
        if user == toWin && winOrLoose == true {
            scoreTitle = "Correct!"
            correctAnswer = true
            score += 1
        }
        else if user != toWin && winOrLoose == false {
            scoreTitle = "Correct!"
            correctAnswer = true
            score += 1
        }
        else if user == toWin && winOrLoose == false {
            scoreTitle = "Wrong!"
            correctAnswer = false
        }
        else if user != toWin && winOrLoose == true {
            scoreTitle = "Wrong!"
            correctAnswer = false
        }
        
        if rounds == selectedRound {
            hasEnded = true
        }
        else {
            showingAlert = true
        }
    }

    func askQuestion() {
        choices.shuffle()
        winOrLoose.toggle()
    }
    
    func restartGame() {
        choices.shuffle()
        score = 0
        rounds = 0
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .font(.title)
            .background(.thickMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 5)
    }
}

extension View {
    func buttonStyle() -> some View {
        modifier(Title())
    }
}

struct RockPaperScissors_Previews: PreviewProvider {
    static var previews: some View {
        RockPaperScissors()
    }
}
