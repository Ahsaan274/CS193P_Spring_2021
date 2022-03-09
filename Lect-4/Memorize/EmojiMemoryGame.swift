//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Avanza on 08/03/2022.
//

import SwiftUI
// viewModel is Intermediary between (Model & View)



class EmojiMemoryGame: ObservableObject {
    
//    type variables
    static let emojis  = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🚚", "🚛", "🚜", "🛴", "🚲", "🛵", "🏍", "🚨", "🚔", "🚍", "🚘", "🚖", "🚡", "🚠"]
    
//    type functions
    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairsOfCards: 3) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    
    var cards: Array<MemoryGame<String>.Card> {
        
        return model.cards
    }

//    MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
