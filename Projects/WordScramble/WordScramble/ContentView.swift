//
//  ContentView.swift
//  WordScramble
//
//  Created by Carolane LEFEBVRE on 03/05/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var newWord = ""
    @State private var rootWord = ""
    
    @State private var score = 0
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                    
                    Text("Score: \(score)")
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                        .accessibilityElement(children: .ignore)
                        .accessibilityLabel(word)
                        .accessibilityHint("\(word.count) letters")
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .toolbar {
                Button("Restart") {
                    restartGame()
                }
            }
            .alert(errorTitle, isPresented: $showingError) {
                Button("Ok", role: .cancel) { }
            } message: {
                Text(errorMessage)
            }
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "This world is already used, try again")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You cannot spell that word, try again")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "This word isn't in our dictionary, try again")
            return
        }
        
        guard isShort(word: answer) else {
            wordError(title: "Word too short", message: "The word must contain more than 3 letters, try again")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
        score += answer.count
    }
    
    func startGame() {
        // Find the URL
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // Load into a string
            if let startWords = try? String(contentsOf: startWordsURL) {
                // Separate each item
                let allWords = startWords.components(separatedBy: "\n")
                // Random word
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        fatalError("Couldn't load the file start.txt from Bundle")
    }
    
    func restartGame() {
        score = 0
        newWord = ""
        usedWords = [String]()
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    func isShort(word: String) -> Bool {
        if word.count < 3 {
            return false
        }
        return true
    }

    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
