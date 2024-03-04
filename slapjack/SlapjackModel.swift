//
//  SlapjackModel.swift
//  slapjack
//
//  Created by Suhani Agrawal on 2/28/24.
//

import Foundation

class SlapjackModel {
    
    var nums : [String: Int] = ["two": 2, "three": 3, "four": 4, "five": 5, "six": 6, "seven": 7, "eight": 8, "nine": 9, "ten": 10]

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
        
        if let imageDescription = nums[rankName]?.description {
          imageName += imageDescription
        } else {
          imageName += rankName.description
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
    
    func numPlayerCards(playerDeck : [Card]) -> Int {
        return playerDeck.count
    }
    
    func numMachineCards(machineDeck : [Card]) -> Int {
        return machineDeck.count
    }
}
