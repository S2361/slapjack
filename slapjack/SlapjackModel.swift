//
//  SlapjackModel.swift
//  slapjack
//
//  Created by Suhani Agrawal on 2/28/24.
//

import Foundation

class SlapjackModel {
    var userDeck : [Card]
    var machineDeck : [Card]
    var deck : Deck
    
    init(userDeck: [Card], machineDeck: [Card], deck: Deck) {
        self.userDeck = userDeck
        self.machineDeck = machineDeck
        self.deck = deck
    }
    
}
