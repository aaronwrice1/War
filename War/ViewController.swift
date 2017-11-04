//
//  ViewController.swift
//  War
//
//  Created by Aaron Rice on 8/8/17.
//  Copyright © 2017 Aaron Rice. All rights reserved.
//

// quadruple wars are unimplemented and bring wrong results

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func warButtonPressed() {
        
        war()
        
    }
    
    
    func war() {
        
        var deck: [Card] = [Card(value: .Ace, suit: .Heart),
                            Card(value: .Two, suit: .Heart),
                            Card(value: .Three, suit: .Heart),
                            Card(value: .Four, suit: .Heart),
                            Card(value: .Five, suit: .Heart),
                            Card(value: .Six, suit: .Heart),
                            Card(value: .Seven, suit: .Heart),
                            Card(value: .Eight, suit: .Heart),
                            Card(value: .Nine, suit: .Heart),
                            Card(value: .Ten, suit: .Heart),
                            Card(value: .Jack, suit: .Heart),
                            Card(value: .Queen, suit: .Heart),
                            Card(value: .King, suit: .Heart),
                            Card(value: .Ace, suit: .Diamond),
                            Card(value: .Two, suit: .Diamond),
                            Card(value: .Three, suit: .Diamond),
                            Card(value: .Four, suit: .Diamond),
                            Card(value: .Five, suit: .Diamond),
                            Card(value: .Six, suit: .Diamond),
                            Card(value: .Seven, suit: .Diamond),
                            Card(value: .Eight, suit: .Diamond),
                            Card(value: .Nine, suit: .Diamond),
                            Card(value: .Ten, suit: .Diamond),
                            Card(value: .Jack, suit: .Diamond),
                            Card(value: .Queen, suit: .Diamond),
                            Card(value: .King, suit: .Diamond),
                            Card(value: .Ace, suit: .Spade),
                            Card(value: .Two, suit: .Spade),
                            Card(value: .Three, suit: .Spade),
                            Card(value: .Four, suit: .Spade),
                            Card(value: .Five, suit: .Spade),
                            Card(value: .Six, suit: .Spade),
                            Card(value: .Seven, suit: .Spade),
                            Card(value: .Eight, suit: .Spade),
                            Card(value: .Nine, suit: .Spade),
                            Card(value: .Ten, suit: .Spade),
                            Card(value: .Jack, suit: .Spade),
                            Card(value: .Queen, suit: .Spade),
                            Card(value: .King, suit: .Spade),
                            Card(value: .Ace, suit: .Club),
                            Card(value: .Two, suit: .Club),
                            Card(value: .Three, suit: .Club),
                            Card(value: .Four, suit: .Club),
                            Card(value: .Five, suit: .Club),
                            Card(value: .Six, suit: .Club),
                            Card(value: .Seven, suit: .Club),
                            Card(value: .Eight, suit: .Club),
                            Card(value: .Nine, suit: .Club),
                            Card(value: .Ten, suit: .Club),
                            Card(value: .Jack, suit: .Club),
                            Card(value: .Queen, suit: .Club),
                            Card(value: .King, suit: .Club)]
        
        var p1Deck: [Card] = []
        var p2Deck: [Card] = []
        
        // deck now shuffled
        deck.shuffle()
        
        // split between two decks
        while deck.count > 0 {
            
            p1Deck.append(deck.removeLast())
            p2Deck.append(deck.removeLast())
            
        }
        
        // players play there "first" card which is the first element of their deck array
        
        var player1: Player = Player(deck: p1Deck)
        var player2: Player = Player(deck: p2Deck)
        
        // play game
        
        
        // stats
        var rounds: Int = 0
        var wars: Int = 0
        var doubleWars: Int = 0
        var tripleWars: Int = 0
        var quadrupleWars: Int = 0
        
        
        print("P1     P2\n")
        
        while player1.deck.count != 0 && player2.deck.count != 0 {
            
            print("\(player1.deck.first!.number)      \(player2.deck.first!.number)")
            
            if player1.deck.first! > player2.deck.first! {
                player1.WonRound(otherCard: player2.deck.first!)
                player2.LostRound()
                
                print("player1 won")
            }
            else if player2.deck.first! > player1.deck.first! {
                player2.WonRound(otherCard: player1.deck.first!)
                player1.LostRound()
                
                print("player2 won")
            }
            else {
                // War!!!
                
                // print("War!")
                wars += 1
                
                var jackpot: [Card] = []
                
                // take three from each player and initial matching cards (total 4 each)
                
                // what if player runs out of cards mid battle????
                // that's what's crashing
                // should play last card and stop
                
                // print("Player 1 remaining cards: \(player1.totalCards)")
                // print("Player 2 remaining cards: \(player2.totalCards)")
                
                // if player1 is going to run out of cards
                if player1.totalCards < 5 {
                    
                    // leave player1 one card
                    while player1.totalCards > 1 {
                        jackpot.append(player1.deck.first!)
                        player1.LostRound()
                    }
                    
                }
                else{
                    jackpot.append(player1.deck.first!)
                    player1.LostRound()
                    jackpot.append(player1.deck.first!)
                    player1.LostRound()
                    jackpot.append(player1.deck.first!)
                    player1.LostRound()
                    jackpot.append(player1.deck.first!)
                    player1.LostRound()
                }
                
                // if player2 is going to run out of cards
                if player2.totalCards < 5 {
                    
                    // leave player2 one card
                    while player2.totalCards > 1 {
                        jackpot.append(player2.deck.first!)
                        player2.LostRound()
                    }
                    
                }
                else{
                    jackpot.append(player2.deck.first!)
                    player2.LostRound()
                    jackpot.append(player2.deck.first!)
                    player2.LostRound()
                    jackpot.append(player2.deck.first!)
                    player2.LostRound()
                    jackpot.append(player2.deck.first!)
                    player2.LostRound()
                }
                
                
                // check who wins the war
                
                if player1.deck.first! > player2.deck.first! {
                    // add defeated card
                    player1.WonRound(otherCard: player2.deck.first!)
                    
                    // add jackpot
                    for card in jackpot {
                        player1.WonRound(otherCard: card)
                    }
                    
                    player2.LostRound()
                    
                    // print("player1 won")
                }
                else if player2.deck.first! > player1.deck.first! {
                    // add defeated card
                    player2.WonRound(otherCard: player1.deck.first!)
                    
                    // add jackpot
                    for card in jackpot {
                        player2.WonRound(otherCard: card)
                    }
                    
                    player1.LostRound()
                    
                    // print("player2 won")
                }
                else {
                    // Double War!!!
                    
                    // print("Double War!")
                    
                    doubleWars += 1
                    
                    
                    // take three from each player and initial matching cards (total 4 each)
                    
                    // if player1 is going to run out of cards
                    if player1.totalCards < 5 {
                        
                        // leave player1 one card
                        while player1.totalCards > 1 {
                            jackpot.append(player1.deck.first!)
                            player1.LostRound()
                        }
                        
                    }
                    else{
                        jackpot.append(player1.deck.first!)
                        player1.LostRound()
                        jackpot.append(player1.deck.first!)
                        player1.LostRound()
                        jackpot.append(player1.deck.first!)
                        player1.LostRound()
                        jackpot.append(player1.deck.first!)
                        player1.LostRound()
                    }
                    
                    // if player2 is going to run out of cards
                    if player2.totalCards < 5 {
                        
                        // leave player2 one card
                        while player2.totalCards > 1 {
                            jackpot.append(player2.deck.first!)
                            player2.LostRound()
                        }
                        
                    }
                    else{
                        jackpot.append(player2.deck.first!)
                        player2.LostRound()
                        jackpot.append(player2.deck.first!)
                        player2.LostRound()
                        jackpot.append(player2.deck.first!)
                        player2.LostRound()
                        jackpot.append(player2.deck.first!)
                        player2.LostRound()
                    }
                    
                    // check who wins the double war
                    
                    if player1.deck.first! > player2.deck.first! {
                        // add defeated card
                        player1.WonRound(otherCard: player2.deck.first!)
                        
                        // add jackpot
                        for card in jackpot {
                            player1.WonRound(otherCard: card)
                        }
                        
                        player2.LostRound()
                        
                        // print("player1 won")
                    }
                    else if player2.deck.first! > player1.deck.first! {
                        // add defeated card
                        player2.WonRound(otherCard: player1.deck.first!)
                        
                        // add jackpot
                        for card in jackpot {
                            player2.WonRound(otherCard: card)
                        }
                        
                        player1.LostRound()
                        
                        // print("player2 won")
                    }
                    else {
                        // Triple War!!!
                        
                        // print("Triple War!")
                        
                        tripleWars += 1
                        
                        // if player1 is going to run out of cards
                        if player1.totalCards < 5 {
                            
                            // leave player1 one card
                            while player1.totalCards > 1 {
                                jackpot.append(player1.deck.first!)
                                player1.LostRound()
                            }
                            
                        }
                        else{
                            jackpot.append(player1.deck.first!)
                            player1.LostRound()
                            jackpot.append(player1.deck.first!)
                            player1.LostRound()
                            jackpot.append(player1.deck.first!)
                            player1.LostRound()
                            jackpot.append(player1.deck.first!)
                            player1.LostRound()
                        }
                        
                        // if player2 is going to run out of cards
                        if player2.totalCards < 5 {
                            
                            // leave player2 one card
                            while player2.totalCards > 1 {
                                jackpot.append(player2.deck.first!)
                                player2.LostRound()
                            }
                            
                        }
                        else{
                            jackpot.append(player2.deck.first!)
                            player2.LostRound()
                            jackpot.append(player2.deck.first!)
                            player2.LostRound()
                            jackpot.append(player2.deck.first!)
                            player2.LostRound()
                            jackpot.append(player2.deck.first!)
                            player2.LostRound()
                        }
                        
                        
                        // check who wins war
                        
                        if player1.deck.first! > player2.deck.first! {
                            // add defeated card
                            player1.WonRound(otherCard: player2.deck.first!)
                            
                            // add jackpot
                            for card in jackpot {
                                player1.WonRound(otherCard: card)
                            }
                            
                            player2.LostRound()
                            
                            // print("player1 won")
                        }
                        else if player2.deck.first! > player1.deck.first! {
                            // add defeated card
                            player2.WonRound(otherCard: player1.deck.first!)
                            
                            // add jackpot
                            for card in jackpot {
                                player2.WonRound(otherCard: card)
                            }
                            
                            player1.LostRound()
                            
                            // print("player2 won")
                        }
                        else {
                            
                            // Quadruple War!
                            // print("Quadruple War!")
                            
                            // ==============
                            // NOT IMPLEMENTED
                            // ==============
                            
                            quadrupleWars += 1
                            
                        }
                        
                    }
                    
                }
                
            }
            
            print("p1 # of cards: - \(player1.totalCards)")
            print("p2 # of cards: - \(player2.totalCards)")
            
            rounds += 1
            
            // print("Player 1 remaining cards: \(player1.totalCards)")
            // print("Player 2 remaining cards: \(player2.totalCards)")
            
            // print("\(player1.totalCards)      \(player2.totalCards)")
            
            // breaks loop
            // if rounds == 5 {
            //     player1.deck.removeAll()
            // }
            
        }
        
        
        // results
        
        if player2.totalCards == 0{
            print("\nPlayer 1 wins after \(rounds) rounds\n")
        }
        else{
            print("\nPlayer 2 wins after \(rounds) rounds\n")
        }
        
        print("Number of wars: \(wars)")
        print("Number of double wars: \(doubleWars)")
        print("Number of triple wars: \(tripleWars)")
        print("Number of quadruple wars: \(quadrupleWars)\n")
        
        print("Player 1 remaining cards: \(player1.totalCards)")
        print("Player 2 remaining cards: \(player2.totalCards)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

