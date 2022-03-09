//
//  MemoryGame.swift
//  Memorize
//
//  Created by Avanza on 08/03/2022.
//

import Foundation

struct MemoryGame<CardContent> { //generics
    private(set) var cards: Array<Card>
    
    func choose(_ card: Card) {
        
    }
    // functions as arguements
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
//        Add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    struct Card {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent // Do not care type (generic)
    }
}
