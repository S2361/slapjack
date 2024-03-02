//
//  SlapjackModel.swift
//  slapjack
//
//  Created by Suhani Agrawal on 2/28/24.
//

import Foundation

class SlapjackModel {

    init() {
    }
    
    func playCard(playerDeck : inout [Card], middlePile : inout [Card]) {
        guard !playerDeck.isEmpty else {
            fatalError("Cannot play a card from an empty deck.")
        }
        
        let playedCard = playerDeck.removeFirst()
        middlePile.append(playedCard)
    }
    
    func burnCard(playerDeck : inout [Card], middlePile : inout [Card]) {
        guard !playerDeck.isEmpty else {
            fatalError("Cannot play a card from an empty deck.")
        }
        
        let playedCard = playerDeck.removeFirst()
        middlePile.insert(playedCard, at: 0)
    }
    
    func middleCardImage(middlePile : [Card]) -> String {
        guard !middlePile.isEmpty else {
            return ""
        }
        var imageName = ""
        let rankName = middlePile[middlePile.count - 1].rank.rawValue
        
        if let rankNum = Int(rankName) {
            imageName += String(rankNum)
        } else {
            imageName += rankName
        }
        
        imageName += "_of_"
        imageName += middlePile[middlePile.count - 1].suit.rawValue
        
        return imageName
    }
    
    func checkCard(card : Card) -> Bool {
        if card.rank == .jack {
            return true
        }
        return false
    }
    
    func randTime() -> Int {
        let minMilliseconds = 100
        let maxMilliseconds = 2000
        
        let range = maxMilliseconds - minMilliseconds + 1

        return minMilliseconds + Int(arc4random_uniform(UInt32(range)))
    }
}
