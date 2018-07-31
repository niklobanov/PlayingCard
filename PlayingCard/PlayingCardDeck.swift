//
//  PlayingCardDeck.swift
//  PlayingCard
//
//  Created by Никита on 31/07/2018.
//  Copyright © 2018 Никита. All rights reserved.
//

import Foundation

struct PlayingCardDeck {
    
    private(set) var cards = [PlayingCard]()
    
    init() {
        for suit in PlayingCard.Suit.all {
            for rank in PlayingCard.Rank.all
            {
                    cards.append(PlayingCard(suit: suit, rank: rank))
            
            }
        }
        
    }
    
    
    
    mutating func draw() -> PlayingCard? {
        if cards.count > 0 {
            return cards.remove(at: cards.count.ar4random)
        } else {
            return nil
        }
    }
    
    
    
}
