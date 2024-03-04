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
    
    @State private var playerTurn = true
    @State private var timerStarted = false
    
    
    func handleMachineTurn() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            timerStarted = true
            slapjackManager.playerTapCard()
            displayedCard = slapjackManager.topMiddleCardName
            machineCardCount = slapjackManager.machineCardCount
            playerName = slapjackManager.playerName
            machineName = slapjackManager.machineName
            playerTurn = true
        }
    }
    
    var body: some View {
        
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
            }
            
            // Player vertical stack (includes player deck, player card count, etc.)
            VStack(spacing: 20) {
                Image("back-deck")
                    .resizable()
                    .frame(width: width_size, height: width_size * height_scale)
                    .onTapGesture {
                        slapjackManager.playerTapCard()
                        displayedCard = slapjackManager.topMiddleCardName
                        playerCardCount = slapjackManager.playerCardCount
                        playerName = slapjackManager.playerName
                        machineName = slapjackManager.machineName
                        playerTurn = false
                        handleMachineTurn()
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
        .padding()
        .padding(.top, 30)
        .padding(.bottom, 30)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(Color(red: 11/255.0, green: 110/255.0, blue: 26/255.0))
    }
}

#Preview {
    ContentView()
}
