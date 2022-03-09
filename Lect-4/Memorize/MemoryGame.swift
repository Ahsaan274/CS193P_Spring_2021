//
//  MemoryGame.swift
//  Memorize
//
//  Created by Avanza on 08/03/2022.
//

import Foundation

struct MemoryGame<CardContent> where CardContent : Equatable { //generics
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCards: Int?
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched
        {
//            if do match the cards
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCards {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCards = nil
            }
            else{
                //            Turn all the faceUp cards down.
                for index in cards.indices{
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCards = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
        print("\(cards)")
    }
    
    // functions as arguements
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        // Add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content,id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent // Do not care type (generic)
        var id: Int
    }
}
