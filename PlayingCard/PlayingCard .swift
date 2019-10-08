//
//  PlayingCard .swift
//  PlayingCard
//
//  Created by Ani on 9/19/19.
//  Copyright © 2019 Ani. All rights reserved.
//

import Foundation

struct PlayingCard : CustomStringConvertible
{
    var description: String{ return "\(suit)\n\(rank)"}
    
    var suit: Suit
    var rank: Rank
    
    enum Suit: String, CustomStringConvertible {
        
        case spades = "♠️"
        case hearts = "♥️"
        case diamonds = "♦️"
        case clubs = "♣️"
        
        
        static var all = [Suit.clubs, .diamonds, .spades, .hearts]
        var description: String {return rawValue}
    }
    
    enum Rank: CustomStringConvertible {
       
        
        case ace
        case face(String)
        case numeric(Int)
        
        var order: Int{
            switch self {
            case .ace: return 1
            case .numeric(let pips): return pips
            case .face(let pips) where pips == "J" : return 11
            case .face(let pips) where pips == "Q" : return 12
            case .face(let pips) where pips == "K" : return 13
                
            default:
                return 0
            }
        }
        
        static var all: [Rank] {
            var allRanks = [Rank.ace]
            for pips in 0...10{
                allRanks.append(Rank.numeric(pips))
            }
            allRanks += [Rank.face("J"),Rank.face("Q"),Rank.face("K")]
            return allRanks
        }
        
        var description: String  {
            switch self {
            case .ace: return "A"
            case .face(let kind): return kind
            case .numeric(let pips): return String(pips)
            }
        }
        
        
    }
}
