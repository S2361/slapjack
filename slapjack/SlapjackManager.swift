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
    @Published private(set) var middlePileCount = 0
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
    
    func checkCard(card : Card) -> Bool {
        if card.rank == .jack {
            return true
        }
        return false
    }
    
    func burnCard() {
        guard !playerDeck.isEmpty else {
            fatalError("Cannot play a card from an empty deck.")
        }
        
        let playedCard = playerDeck.removeFirst()
        middlePile.insert(playedCard, at: 0)
    }
    
    func playerCollectMiddlePile() {
        for i in 0...middlePile.count - 1 {
            playerDeck.append(middlePile[i])
        }
        
        middlePile = []
        playerDeck.shuffle()
    }
    
    func machineCollectMiddlePile() {
        for i in 0...middlePile.count - 1 {
            machineDeck.append(middlePile[i])
        }
        
        middlePile = []
        machineDeck.shuffle()
    }
    
    func randTime() -> Int {
        let minMilliseconds = 100
        let maxMilliseconds = 2000
        
        let range = maxMilliseconds - minMilliseconds + 1

        return minMilliseconds + Int(arc4random_uniform(UInt32(range)))
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
        middlePileCount = gameModel.numMiddlePile(middlePile: middlePile)
        
        // To update the middle card
        topMiddleCardName = gameModel.middleCardImage(middlePile: middlePile)
        
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
        middlePileCount = gameModel.numMiddlePile(middlePile: middlePile)
        
        // To update the middle card
        topMiddleCardName = gameModel.middleCardImage(middlePile: middlePile)
        
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
    
    func gameOver() -> Bool {
        return machineDeck.isEmpty || playerDeck.isEmpty
    }
    
    func gameOutcome() -> String {
        if machineDeck.isEmpty && playerDeck.isEmpty {
            return "Draw"
        } else if machineDeck.isEmpty {
            return "Machine Won"
        } else if playerDeck.isEmpty {
            return "Player Won"
        }
        return ""
    }
    
    func resetGame() {
        self.deck.shuffle()
        self.playerDeck = Array(deck.cards[0..<deck.cards.count / 2])
        self.machineDeck = Array(deck.cards[(deck.cards.count / 2)..<deck.cards.count])
        self.middlePile = Array()
    }
    
    
    
}
