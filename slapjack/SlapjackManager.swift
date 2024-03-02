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
    @Published private(set) var playerName = "- Player -"
    
    @Published private(set) var machineDeck : [Card]
    @Published private(set) var machineCardCount = 26
    @Published private(set) var machineName = "Machine"
    
    @Published private(set) var middlePile : [Card]
    @Published private(set) var playerTurn = true
    @Published var topMiddleCardName = ""
    
    var gameModel = SlapjackModel()
    
    private(set) var deck : Deck
    let timer = Timer.publish()
    
    init() {
        self.deck = Deck()
        self.deck.shuffle()
        self.playerDeck = Array(deck.cards[0..<deck.cards.count / 2])
        self.machineDeck = Array(deck.cards[(deck.cards.count / 2)..<deck.cards.count])
        self.middlePile = Array()
    }
    
    func handleTurn(playerTurn: Bool) {
        if (playerTurn && playerDeck.isEmpty || !playerTurn && machineDeck.isEmpty) {
            // Handle empty hand scenario
            return
        }
        
        // Checks which player needs to add card to middle pile
        if playerTurn {     // If it is the player(user)
            gameModel.playCard(playerDeck: &playerDeck, middlePile: &middlePile)
            playerCardCount -= 1
        } else {    // If it is the machine
            gameModel.playCard(playerDeck: &machineDeck, middlePile: &middlePile)
            machineCardCount -= 1
        }
        
        // To update the middle card
        topMiddleCardName = gameModel.middleCardImage(middlePile: middlePile)
        
        // Checks if the played card is jack
        if gameModel.checkCard(card: middlePile[middlePile.count - 1]) {
            
        }
        
        if playerTurn {
            playerName = "Player"
            machineName = "- Machine -"
        } else {
            playerName = "- Player -"
            machineName = "Machine"
        }
        
        let nextPlayerTurn = playerTurn ? false : true
        handleTurn(playerTurn: nextPlayerTurn)
        
    }
    
    
    
    
    
    
}
