//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Avanza on 01/03/2022.
//

import SwiftUI

@main
struct MemorizeApp: App {
//    class are mutable
    private let game = EmojiMemoryGame.init()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
