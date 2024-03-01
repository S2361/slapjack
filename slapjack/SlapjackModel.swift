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
    var middlePile : [Card]
    var deck : Deck
    
    init() {
        self.deck = Deck()
        self.deck.shuffle()
        self.userDeck = Array(deck.cards[0..<deck.cards.count / 2])
        self.machineDeck = Array(deck.cards[(deck.cards.count / 2)..<deck.cards.count])
        self.middlePile = Array()
    }
    
    func playCard(playerDeck : inout [Card]) -> Card {
        guard !playerDeck.isEmpty else {
            fatalError("Cannot play a card from an empty deck.")
        }
        
        let playedCard = playerDeck.removeFirst()
        middlePile.append(playedCard)
        return playedCard
    }
    
    func burnCard(playerDeck : inout [Card]) -> Card {
        guard !playerDeck.isEmpty else {
            fatalError("Cannot play a card from an empty deck.")
        }
        
        let playedCard = playerDeck.removeFirst()
        middlePile.insert(playedCard, at: 0)
        return playedCard
    }
    
    func randTime() -> Int {
        let minMilliseconds = 100
        let maxMilliseconds = 2000
        
        let range = maxMilliseconds - minMilliseconds + 1

        return minMilliseconds + Int(arc4random_uniform(UInt32(range)))
    }
}
