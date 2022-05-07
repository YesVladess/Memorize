//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by YesVladess on 26.12.2021.
//

import SwiftUI

// This is ViewModel
class EmojiMemoryGame: ObservableObject {

    enum Theme {
        case vehihles
        case animals
        case faces
    }

    static let emojisVehihles = ["🚗", "🚕", "🚙", "🚎", "🏎", "🚑", "🚌", "🚓",  "🚒", "🚐", "🛻", "🚚", "🚛" , "🚜"]
    static let emojisAnimals = ["🐶", "🐱", "🐭", "🐰", "🦊", "🐼", "🐻", "🐻‍❄️",  "🐨", "🐸", "🦉", "🦋"]
    static let emojisFaces = ["😋", "🥲", "😟", "😕", "🤩", "🙁", "😢", "🥺",  "😤", "🤯"]

    @Published private var model = MemoryGame<String> { pairIndex in
        EmojiMemoryGame.emojisVehihles[pairIndex]
    }
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }

    // MARK: - Intent

    func choose(_ card: MemoryGame<String>.Card) {
        //objectWillChange.send()
        model.choose(card)
    }

    func restartGame(theme: Theme) {
        var cards: [String] = []
        switch theme {
        case .vehihles:
            cards = EmojiMemoryGame.emojisVehihles
        case .animals:
            cards = EmojiMemoryGame.emojisAnimals
        case .faces:
            cards = EmojiMemoryGame.emojisFaces
        }
        model = MemoryGame<String> { pairIndex in
            cards[pairIndex]
        }
    }
}
