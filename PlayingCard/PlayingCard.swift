//
//  PlayingCard.swift
//  PlayingCard
//
//  Created by Никита on 31/07/2018.
//  Copyright © 2018 Никита. All rights reserved.
//

import Foundation

struct PlayingCard: CustomStringConvertible {
    
    var description: String { return "\(rank)\(suit)" }
    
    
    
    var suit: Suit
    var rank: Rank
    
    
    enum Suit: String, CustomStringConvertible {
        case spades =  "♠️"
        case diamonds = "♦️"
        case hearts = "♥️"
        case clubs = "♣️"
        static var all: [Suit] = [Suit.spades, .diamonds, .clubs, .hearts]
        var description: String { return rawValue }
    }
    
    enum Rank: CustomStringConvertible {
        case ace
        case face(String)
        case numeric(Int)
        
        var order: Int {
            switch self {
            case .ace: return 1
            case .numeric(let pips): return pips
            case .face(let kind) where kind == "J" : return 11
            case .face(let kind) where kind == "Q" : return 12
            case .face(let kind) where kind == "K" : return 13
            default: return 0
                
            }
        }
        
        
        static var all: [Rank] {
            var allRanks = [Rank.ace]
            for pips in 2...10 {
                allRanks.append(Rank.numeric(pips))
            }
            allRanks += [Rank.face("J"), .face("Q"), .face("K")]
            return allRanks
        }
        
        var description: String {
            switch self {
            case Rank.ace: return "A"
            case Rank.face(let kind): return kind
            case Rank.numeric(let pips): return String(pips)
            }
        }
    }
    
}
