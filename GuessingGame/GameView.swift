//
//  GameView.swift
//  GuessingGame
//
//  Created by Russell Gordon on 2024-01-29.
//

import SwiftUI

struct GameView: View {
    
    // MARK: Stored properties
    
    // What number the user has guessed
    @State var givenInput = ""
    
    // What number the computer wants the user to guess
    @State var target = Int.random(in: 1...100)
    
    // Feedback to the user on what to try next
    @State var feedback = ""
    
    // The list of numbers the user has guessed so far
    @State var guessesMade: [Int] = []
    
    // MARK: Computed properties
    var body: some View {
        
        NavigationStack {
            VStack(spacing: 30) {
                
                Text("I'm thinking of a number between 1 and 100.")
                
                Text("Guess what it is!")
                    .font(.headline)
                
                TextField("Make a guess", text: $givenInput)
                
                Button {
                    checkGuess()
                } label: {
                    Text("Submit Guess")
                }
                .buttonStyle(.borderedProminent)
                
                Text(feedback)
                    .font(
                        .custom(
                            "BradleyHandITCTT-Bold",
                            size: 24.0,
                            relativeTo: .title3
                        )
                    )
                    

                Button {
                    reset()
                } label: {
                    Text("Reset")
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)

                
                // Show the user's guesses
                Text("Guesses made")
                    .font(.title3.smallCaps())
                ScrollView {
                    VStack(spacing: 5) {
                        ForEach(guessesMade, id: \.self) { currentGuess in
                            Text("\(currentGuess)")
                            Divider()
                        }
                    }
                }
                
                Spacer()
                
            }
            .padding()
            .navigationTitle("Guessing Game")
            
        }

    }
    
    // MARK: Functions
    func checkGuess() {
        // Attempt to unwrap the input provided by the user
        guard let selectedNumber = Int(givenInput) else {
            feedback = "Please provide an integer."
            return
        }
        
        // Provide feedback to the user
        // When should they guess higher?
        // When should then guess lower?
        // FILL IN THIS CODE
   
        let a = selectedNumber
        let b = target
        if a > b {
            feedback = ("\(selectedNumber) is bigger")
        } else if a < b {
            feedback = ("\(selectedNumber) is smaller")
        } else {
            feedback = ("You are correct!")
        }
        
        
        // Save the user's guesses
        guessesMade.append(selectedNumber)
        
    }

    // Start a new game
    func reset() {

        // Start the user back with an empty string
        givenInput = ""
        
        // Have the computer guess a new number
        target = Int.random(in: 1...100)
        
        // Reset feedback
        feedback = ""
        
        // Remove guesses made
        guessesMade.removeAll()
        
    }

}

#Preview {
    GameView()
}
