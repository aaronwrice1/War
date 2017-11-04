//
//  Card.swift
//  War
//
//  Created by Aaron Rice on 8/8/17.
//  Copyright © 2017 Aaron Rice. All rights reserved.
//

import Foundation

// for a card

class Card : CustomStringConvertible, Equatable, Comparable {
    let value: Value
    let suit: Suit
    let number: Int
    
    init(value: Value, suit: Suit) {
        self.value = value
        self.suit = suit
        
        // determine number based on value
        if value == .Two {
            self.number = 2
        }
        else if value == .Three {
            self.number = 3
        }
        else if value == .Four {
            self.number = 4
        }
        else if value == .Five {
            self.number = 5
        }
        else if value == .Six {
            self.number = 6
        }
        else if value == .Seven {
            self.number = 7
        }
        else if value == .Eight {
            self.number = 8
        }
        else if value == .Nine {
            self.number = 9
        }
        else if value == .Ten {
            self.number = 10
        }
        else if value == .Jack {
            self.number = 11
        }
        else if value == .Queen {
            self.number = 12
        }
        else if value == .King{
            self.number = 13
        }
        else {
            // Ace
            self.number = 14
        }
    }
    
    var description: String {
        return "\(value) of \(suit)s"
    }
    
    static func == (this: Card, other: Card) -> Bool{
        return this.number == other.number
    }
    
    static func < (this: Card, other: Card) -> Bool{
        return this.number < other.number
    }
}

enum Value {
    case Ace
    case Two
    case Three
    case Four
    case Five
    case Six
    case Seven
    case Eight
    case Nine
    case Ten
    case Jack
    case Queen
    case King
}

enum Suit {
    case Heart
    case Club
    case Spade
    case Diamond
}



// for a player

struct Player {
    var deck: [Card]
    var discarded: [Card] = []
    
    var totalCards: Int {
        return deck.count + discarded.count
    }
    
    init (deck: [Card]) {
        self.deck = deck
    }
    
    // mutating func LostRound
    // remove card from deck
    mutating func LostRound() {
        deck.removeFirst()
        
        reshuffle()
    }
    
    // mutating func WonRound
    // put card and other card in discarded
    mutating func WonRound(otherCard: Card) {
        discarded.append(deck.removeFirst())
        discarded.append(otherCard)
        
        reshuffle()
    }
    
    // if deck is 0 reshuffle discarded and put into deck
    mutating func reshuffle() {
        if deck.count == 0 && discarded.count != 0{
            discarded.shuffle()
            deck = discarded
            discarded.removeAll()
        }
    }
    
}


// to shuffle cards (arrays)

extension MutableCollection where Indices.Iterator.Element == Index {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled , unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            let d: IndexDistance = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            guard d != 0 else { continue }
            let i = index(firstUnshuffled, offsetBy: d)
            swap(&self[firstUnshuffled], &self[i])
        }
    }
}
