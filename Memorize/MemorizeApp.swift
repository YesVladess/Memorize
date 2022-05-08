//
//  MemorizeApp.swift
//  Memorize
//
//  Created by YesVladess on 18.12.2021.
//

import SwiftUI

@main
struct MemorizeApp: App {

    private let game = EmojiMemoryGame()

    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
    
}
