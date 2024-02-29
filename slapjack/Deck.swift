//
//  Deck.swift
//  slapjack
//
//  Created by Suhani Agrawal on 2/28/24.
//

import Foundation

class Deck {
    
    var deck : [Card]
    
    init() {
        deck = []
        for suit in Card.Suit.allCases {
            for rank in Card.Rank.allCases {
                self.deck.append(Card(suit: suit, rank: rank))
            }
        }
    }
    
    func shuffle() {
        deck.shuffle()
    }
    
    func dealCard() -> Card {
        return deck.removeFirst()
    }
}
