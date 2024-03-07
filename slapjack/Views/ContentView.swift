//
//  ContentView.swift
//  slapjack
//
//  Created by Suhani Agrawal on 2/27/24.
//

import SwiftUI

let height_scale = 1.45
let width_size = 100.0


struct ContentView: View {
    
    // Creating slapjack manager
    @StateObject var slapjackManager = SlapjackManager()
    
    // Dynamic variables to change state of screen when needed
    @State private var displayedCard: String = ""   // To change middle pile card
    @State private var playerName: String = "- Player -"
    @State private var machineName: String = "Machine"
    @State private var playerCardCount = 26   // Card count of player
    @State private var machineCardCount = 26  // Card count of machine
    @State private var middlePileCount = 0
    
    @State private var playerTurn = true
    
    @State private var randTime = 0.0
    @State private var timerStarted = false
    
    @State private var playerTappedInTime = false
    @State private var cardIsJack = false
    
    @State private var actionDisplay: String = "Player Turn"
    
    @State private var showResult = false
    
    @State private var resultMessage: String = ""
    
    @State private var resultAlert = Alert(title: Text("Game Over..."),
                       message: Text(""),
                      dismissButton: .default(Text("Play Again")))
    
    
    func handleMachineTurn() {
        actionDisplay = "Machine Turn"
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            slapjackManager.playerTapCard()
            displayedCard = slapjackManager.topMiddleCardName
            machineCardCount = slapjackManager.machineCardCount
            middlePileCount = slapjackManager.middlePileCount
            
            if slapjackManager.checkCard(card: slapjackManager.middlePile[slapjackManager.middlePile.count - 1]) {
                cardIsJack = true
                handleJack()
            }
            
            if (slapjackManager.gameOver()) {
                showResult = true
                slapjackManager.resetGame()
                resultMessage = slapjackManager.gameOutcome()
                resultAlert = Alert(title: Text("Game Over..."),
                      message: Text(resultMessage),
                      dismissButton: .default(Text("Play Again")))
            }
            
            playerName = slapjackManager.playerName
            machineName = slapjackManager.machineName
            playerTurn = true
            actionDisplay = "Player Turn"
        }
    }
    
    func handlePlayerTurn() {
        slapjackManager.playerTapCard()
        displayedCard = slapjackManager.topMiddleCardName
        playerCardCount = slapjackManager.playerCardCount
        middlePileCount = slapjackManager.middlePileCount
        
        if slapjackManager.checkCard(card: slapjackManager.middlePile[slapjackManager.middlePile.count - 1]) {
            cardIsJack = true
            handleJack()
        }
        
        if (slapjackManager.gameOver()) {
            showResult = true
            slapjackManager.resetGame()
            resultMessage = slapjackManager.gameOutcome()
            resultAlert = Alert(title: Text("Game Over..."),
                  message: Text(resultMessage),
                  dismissButton: .default(Text("Play Again")))
        }
        
        playerName = slapjackManager.playerName
        machineName = slapjackManager.machineName
        playerTurn = false
        
    }
    
    func handleJack() {
        randTime = Double(slapjackManager.randTime()) / 1000.0
        print(randTime)
        DispatchQueue.main.asyncAfter(deadline: .now() + randTime) {
            print("playerTappedInTime ", playerTappedInTime)
            if playerTappedInTime {
                slapjackManager.playerCollectMiddlePile()
                cardIsJack = false
                playerTappedInTime = false
                displayedCard = ""
                middlePileCount = slapjackManager.middlePileCount
                playerCardCount = slapjackManager.playerCardCount
                actionDisplay = "Player Gets Pile"
            } else {
                slapjackManager.machineCollectMiddlePile()
                cardIsJack = false
                displayedCard = ""
                middlePileCount = slapjackManager.middlePileCount
                machineCardCount = slapjackManager.machineCardCount
                actionDisplay = "Machine Gets Pile"
            }
        }
    }
    
    
    
    var body: some View {
        HStack (spacing: -20) {
            Text(actionDisplay)
                .rotationEffect(.degrees(-90))
                .foregroundStyle(Color.white)
                .fontWeight(.heavy)
                .font(.title3)
                .frame(width: 200, height: 50)
            
            // Vertical stack for components on screen
            VStack(spacing: 50) {
                // Machine vertical stack (includes machine deck, machine card count, etc.)
                VStack(spacing: 20) {
                    HStack {
                        Text("Card Count:")
                            .foregroundStyle(Color.white)
                            .bold()
                        
                        Text(String(machineCardCount))
                            .foregroundStyle(Color.white)
                            .bold()
                    }
                    
                    Text(machineName)
                        .titleText()
                    
                    Image("back-deck")
                        .resizable()
                        .frame(width: width_size, height: width_size * height_scale)
                }
                
                // Middle Pile stack
                VStack(spacing: 20) {
                    Image(displayedCard)
                        .resizable()
                        .frame(width: width_size, height: width_size * height_scale)
                        .onTapGesture {
                            if cardIsJack {
                                playerTappedInTime = true
                            } else {
                                slapjackManager.burnCard()
                                actionDisplay = "Player Card Burned"
                            }
                        }
                        
                    HStack {
                        Text("Pile Count:")
                            .foregroundStyle(Color.white)
                            .bold()
                            
                        Text(String(middlePileCount))
                            .foregroundStyle(Color.white)
                            .bold()
                    }
                    
                }
                
                // Player vertical stack (includes player deck, player card count, etc.)
                VStack(spacing: 20) {
                    Image("back-deck")
                        .resizable()
                        .frame(width: width_size, height: width_size * height_scale)
                        .onTapGesture {
                            if playerTurn {
                                handlePlayerTurn()
                                handleMachineTurn()
                            }
                        }
                    
                    Text(playerName)
                        .titleText()
                    
                    HStack {
                        Text("Card Count:")
                            .foregroundStyle(Color.white)
                            .bold()
                        
                        Text(String(playerCardCount))
                            .foregroundStyle(Color.white)
                            .bold()
                    }
                }
            }
        }
        
        .padding(.leading, -150)
        .padding(.top, 30)
        .padding(.bottom, 30)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(Color(red: 11/255.0, green: 110/255.0, blue: 26/255.0))
        .alert(isPresented: $showResult, content: { resultAlert })
    }
}

#Preview {
    ContentView()
}
