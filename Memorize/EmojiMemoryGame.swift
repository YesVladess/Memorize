//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by YesVladess on 26.12.2021.
//

import SwiftUI

// This is ViewModel
class EmojiMemoryGame: ObservableObject {

    static let emojisVehihles = ["🚗", "🚕", "🚙", "🚎", "🏎", "🚑", "🚌", "🚓",  "🚒", "🚐", "🛻", "🚚", "🚛" , "🚜"]
    static let emojisAnimals = ["🐶", "🐱", "🐭", "🐰", "🦊", "🐼", "🐻", "🐻‍❄️",  "🐨", "🐸", "🦉", "🦋"]
    static let emojisFaces = ["😋", "🥲", "😟", "😕", "🤩", "🙁", "😢", "🥺",  "😤", "🤯"]

    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 8) { pairIndex in
            emojisVehihles[pairIndex] }
    }

    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }

    // MARK: - Intent
    func choose(_ card: MemoryGame<String>.Card) {
        //objectWillChange.send()
        model.choose(card)
    }
}
