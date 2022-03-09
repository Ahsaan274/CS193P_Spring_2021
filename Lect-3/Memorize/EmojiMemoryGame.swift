//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Avanza on 08/03/2022.
//

import SwiftUI
// viewModel is Intermediary between (Model & View)



class EmojiMemoryGame {
    
//    type variables
    static let emojis  = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🚚", "🚛", "🚜", "🛴", "🚲", "🛵", "🏍", "🚨", "🚔", "🚍", "🚘", "🚖", "🚡", "🚠"]
    
//    type functions
    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    
    var cards: Array<MemoryGame<String>.Card> {
        
        return model.cards
    }
//    instance functions
//    func foo(){
//        var fooo = emojis
//        
//    }
}
