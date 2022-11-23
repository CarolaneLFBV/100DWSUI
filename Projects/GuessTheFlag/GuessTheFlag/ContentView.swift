//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Carolane LEFEBVRE on 09/11/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italie", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var showingEnd = false
    @State private var scoreTitle = ""
    
    @State private var score = 0
    @State private var question = 0
    
    func endofGame() {
        switch score {
        case 0...2:
            scoreTitle = "Tu peux mieux faire"
        case 3...5:
            scoreTitle = "Encore un petit effort!"
        case 6...7:
            scoreTitle = "Bravo! Presque un génie!"
        case 8:
            scoreTitle = "Félicitations! Vous avez eu tout juste!"
        default:
            scoreTitle = "Bravo! Fin du jeu!"
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong"
            score -= 1
        }
        question += 1
        showingScore = true
        
        if (question == 8) {
            endofGame()
            showingEnd = true
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func resetGame() {
        correctAnswer = Int.random(in: 0...2)
        score = 0
        question = 0
    }
    
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: .blue, location: 0.3),
                .init(color: .red, location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                
                Spacer()
                
                Text("Question: \(question)/8")
                    .foregroundColor(.white)
                
                Spacer()

                Text("Score: \(score)")
                    .font(.title.bold())
                    .foregroundColor(.white)
                
                Spacer()

                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    .foregroundStyle(.secondary)
                    
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .roundedFlagStyle()
                        }
                    }
                }
                .frameStyle()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continuer", action: askQuestion)
            Button("Recommencer", action: resetGame)
        } message: {
            Text("Score: \(score)")
        }
        
        .alert(scoreTitle, isPresented: $showingEnd) {
            Button("Recommencer", action: resetGame)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
