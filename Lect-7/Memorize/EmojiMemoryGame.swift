//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Avanza on 08/03/2022.
//

import SwiftUI
// viewModel is Intermediary between (Model & View)
class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    private static let emojis  = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🚚", "🚛", "🚜", "🛴", "🚲", "🛵", "🏍", "🚨", "🚔", "🚍", "🚘", "🚖", "🚡", "🚠"]
    
    private static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    
    var cards: Array<Card> {
        return model.cards
    }

//    MARK: - Intent(s)
    func choose(_ card: Card){
        model.choose(card)
    }
}
