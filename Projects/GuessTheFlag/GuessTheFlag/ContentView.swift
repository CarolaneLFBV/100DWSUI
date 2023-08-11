    //
    //  ContentView.swift
    //  GuessTheFlag
    //
    //  Created by Carolane LEFEBVRE on 07/04/2023.
    //

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    let labels = [
        "Estonia": "Flag with three horizontal stripes of equal size. Top stripe blue, middle stripe black, bottom stripe white",
        "France": "Flag with three vertical stripes of equal size. Left stripe blue, middle stripe white, right stripe red",
        "Germany": "Flag with three horizontal stripes of equal size. Top stripe black, middle stripe red, bottom stripe gold",
        "Ireland": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe orange",
        "Italy": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe red",
        "Nigeria": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe green",
        "Poland": "Flag with two horizontal stripes of equal size. Top stripe white, bottom stripe red",
        "Russia": "Flag with three horizontal stripes of equal size. Top stripe white, middle stripe blue, bottom stripe red",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background",
        "US": "Flag with red and white stripes of equal size, with white stars on a blue background in the top-left corner"
    ]
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    @State private var showingEnd = false
    @State private var question = 0
    
    @State private var animationAmount = 0.0
    @State private var isTapped = false
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            
            VStack {
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of...")
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    .foregroundColor(.white)
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                            isTapped.toggle()
                            isFlagTapped()
                        } label: {
                            Image(countries[number])
                                .flagStyle()
                                .accessibilityLabel(labels[countries[number], default: "Unknown flag"])
                        }
                    }
                }
                .frameStyle()
            }
            
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        .alert(scoreTitle, isPresented: $showingEnd) {
            Button("Restart", action: restartGame)
        } message: {
            Text("End of the game! Play again? ")
        }
    }
    
    func flagTapped(_ number: Int) {
        if question < 8 {
            if number == correctAnswer {
                scoreTitle = "Congrats! You are correct!"
                score += 1
            } else {
                scoreTitle = "Wrong! That's the flag of \(countries[correctAnswer])"
                score -= 1
            }
            question += 1
            showingScore = true
        } else {
            switch score {
                case 0...2:
                    scoreTitle = "That was.. meh."
                    
                case 3...5:
                    scoreTitle = "Well.. You can do better"
                    
                case 6...7:
                    scoreTitle = "Wow! You are pretty good at this! Keep it up!"
                    
                case 8:
                    scoreTitle = "You are a genius!"
                    
                default:
                    scoreTitle = "Score"
            }
            showingEnd = true
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func restartGame() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        score = 0
        question = 0
    }
    
    func isFlagTapped() {
        if isTapped {
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                animationAmount += 360
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
