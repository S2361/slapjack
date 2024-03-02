//
//  SlapjackManager.swift
//  slapjack
//
//  Created by Suhani Agrawal on 3/2/24.
//

import Foundation
import SwiftUI

class SlapjackManager : ObservableObject {
    
    @Published private(set) var userDeck : [Card]
    @Published private(set) var machineDeck : [Card]
    @Published private(set) var middlePile : [Card]
    @Published private(set) var playerTurn = true
    
    private(set)var deck : Deck
    
    init() {
        self.deck = Deck()
        self.deck.shuffle()
        self.userDeck = Array(deck.cards[0..<deck.cards.count / 2])
        self.machineDeck = Array(deck.cards[(deck.cards.count / 2)..<deck.cards.count])
        self.middlePile = Array()
    }
    
    
    
    
    
    
    
    
}
