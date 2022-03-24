//
//  MemoryGame.swift
//  Memorize
//
//  Created by Avanza on 08/03/2022.
//

import Foundation

struct MemoryGame<CardContent> where CardContent : Equatable { //generics
    private(set) var cards: Array<Card>

    //    computed property
    private var indexOfTheOneAndOnlyFaceUpCards: Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly }
        set { cards.indices.forEach{ cards[$0].isFaceUp = ($0 == newValue)}
            
        }
    }
mutating func choose(_ card: Card) {
    if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
       !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched
    {
        
        if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCards {
            //            if do match the cards
            if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                cards[chosenIndex].isMatched = true
                cards[potentialMatchIndex].isMatched = true
            }
            cards[chosenIndex].isFaceUp = true
        }
        else{
            //            if do not match the cards.
            
            indexOfTheOneAndOnlyFaceUpCards = chosenIndex
        }
    }
}

// functions as arguements
init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
    cards = []
    //        cards = Array<Card>() Empty Array
    // Add numberOfPairsOfCards x 2 cards to cards array
    for pairIndex in 0..<numberOfPairsOfCards {
        let content = createCardContent(pairIndex)
        cards.append(Card(content: content,id: pairIndex*2))
        cards.append(Card(content: content,id: pairIndex*2+1))
    }
}
struct Card: Identifiable {
    var isFaceUp = false
    var isMatched = false
    let content: CardContent // Do not care type (generic)
    let id: Int
}
}
extension Array {
    var oneAndOnly: Element? {
        if count == 1{
            return first
        }else{
            return nil
        }

    }
    
}
