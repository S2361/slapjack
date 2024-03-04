//
//  SlapjackManager.swift
//  slapjack
//
//  Created by Suhani Agrawal on 3/2/24.
//

import Foundation
import SwiftUI
import Combine

class SlapjackManager : ObservableObject {
    
    @Published private(set) var playerDeck : [Card]
    @Published private(set) var playerCardCount = 26
    @Published var playerName = "- Player -"
    
    @Published private(set) var machineDeck : [Card]
    @Published private(set) var machineCardCount = 26
    @Published var machineName = "Machine"
    
    @Published private(set) var middlePile : [Card]
    @Published private(set) var playerTurn = true
    @Published var topMiddleCardName = ""
    
    var gameModel = SlapjackModel()
    
    private(set) var deck : Deck
    let timer = Timer.publish(every: 0.002, on: .main, in: .default)
    var timerStarted = false
    
    init() {
        self.deck = Deck()
        self.deck.shuffle()
        self.playerDeck = Array(deck.cards[0..<deck.cards.count / 2])
        self.machineDeck = Array(deck.cards[(deck.cards.count / 2)..<deck.cards.count])
        self.middlePile = Array()
    }
    
    func handlePlayerTurn(playerTurn: Bool) {
        if (!self.playerTurn) {
            // Player shouldn't be tapping
            return
        } else if (self.playerTurn && playerDeck.isEmpty) {
            // Handle empty hand scenario
            return
        }
        
        // Checks which player needs to add card to middle pile
        gameModel.playCard(playerDeck: &playerDeck, middlePile: &middlePile)
        playerCardCount = gameModel.numPlayerCards(playerDeck: playerDeck)
        
        // To update the middle card
        topMiddleCardName = gameModel.middleCardImage(middlePile: middlePile)
        
        // Checks if the played card is jack
        // if gameModel.checkCard(card: middlePile[middlePile.count - 1]) {
            
        // }
        
        self.playerName = "Player"
        self.machineName = "- Machine -"
        
        self.playerTurn = false
        
    }
    
    func handleMachineTurn(playerTurn: Bool) {
        if (!self.playerTurn && machineDeck.isEmpty) {
            // Handle empty hand scenario
            return
        }
        
        // Checks which player needs to add card to middle pile
        gameModel.playCard(playerDeck: &machineDeck, middlePile: &middlePile)
        machineCardCount = gameModel.numPlayerCards(playerDeck: machineDeck)
        
        // To update the middle card
        topMiddleCardName = gameModel.middleCardImage(middlePile: middlePile)
        
        // Checks if the played card is jack
        if gameModel.checkCard(card: middlePile[middlePile.count - 1]) {
            
        }
        
        self.playerName = "- Player -"
        self.machineName = "Machine"
        
        self.playerTurn = true
        
    }
    
    func playerTapCard() {
        if playerTurn {
            handlePlayerTurn(playerTurn: playerTurn)
        } else {
            handleMachineTurn(playerTurn: playerTurn)
        }
        
    }
    
    
}
