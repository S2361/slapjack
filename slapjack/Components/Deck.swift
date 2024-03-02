//
//  Deck.swift
//  slapjack
//
//  Created by Suhani Agrawal on 3/2/24.
//

import Foundation

class Deck {
    
    var cards : [Card]
    
    init() {
        cards = []
        for suit in Card.Suit.allCases {
            for rank in Card.Rank.allCases {
                self.cards.append(Card(suit: suit, rank: rank))
            }
        }
    }
    
    func shuffle() {
        cards.shuffle()
    }
    
}
