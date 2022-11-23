//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Carolane LEFEBVRE on 23/11/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var gameChoices = ["👊", "✋", "✌️"]
    // --- Computer ---
    @State private var computerAnswer = Int.random(in: 0...2)
    @State private var relation =  Bool.random() ? "WIN" : "LOSE"
    // --- User ---
    @State private var userAnswer = 0
    @State private var score = 0
    // --- Result ---
    @State private var showingResult = false
    @State private var result = ""
    
    private var correctAnswer: Int {
          return (relation == "WIN") ? ( (computerAnswer + 1) % 3) :
              ((computerAnswer + 2) % 3)
    }
    
    // --- Game functions ---
    func checkAnswer(usersAnswer: Int) {
        if userAnswer == self.correctAnswer {
            score += 1
            result = "Correct"
        } else {
            score -= 1
            result = "Incorrect"
        }
        showingResult = true
    }
    
    func continueGame() {
        computerAnswer = Int.random(in: 0...2)
        relation =  Bool.random() ? "WIN" : "LOSE"
    }
    
    func newGame(){
        continueGame()
        score = 0
    }
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20){
                Spacer()
                
                Section{
                    Text("Computer plays")
                    Text("\(self.gameChoices[computerAnswer])")
                        .buttonStyle()
                }
                .styleText()
                
                Spacer()
                
                Section {
                    HStack(spacing: 0){
                        Text("You need to ")
                            .styleText()
                        Text("\(relation)")
                            .styleRelation()
                    }
                }
                
                Spacer()
                
                Section {
                    Text("You should play")
                        .styleText()
                    HStack{
                        ForEach(0...2, id:\.self) { index in
                            Button(action: {self.checkAnswer(usersAnswer: index)}) {
                                Text(" \(self.gameChoices[index])")
                                    .buttonStyle()
                            }
                        }
                    }
                }
                
                Spacer()
                
                Section {
                    Text("Score: \(self.score)")
                        .styleText()
                }
                Spacer()
            }
            .alert(isPresented: $showingResult) {
                Alert(title: Text("\(self.result)"),
                      primaryButton: .default(Text("Continue")) {
                        self.continueGame()
                },
                      secondaryButton: .default(Text("New Game")) {
                        self.newGame()
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
