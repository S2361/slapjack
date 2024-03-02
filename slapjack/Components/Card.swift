//
//  Card.swift
//  slapjack
//
//  Created by Suhani Agrawal on 3/2/24.
//

import Foundation

struct Card {
    
    enum Suit : String, CaseIterable {
        case spades, clubs, hearts, diamonds
    }
    
    enum Rank : String, CaseIterable {
        case ace, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
    }
    
    let suit : Suit
    let rank : Rank
}
