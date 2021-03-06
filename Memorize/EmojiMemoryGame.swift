//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by YesVladess on 26.12.2021.
//

import SwiftUI

// This is ViewModel
class EmojiMemoryGame: ObservableObject {

    // MARK: Themes

    struct Theme {
        var name: String
        var emojis: [String]
        var color: Color
    }

    typealias Card = MemoryGame<String>.Card

    private let avaliableThemes = [vehihles, animals, faces]

    private static let vehihles = Theme(name: "Vehihles",
                                        emojis: ["🚗", "🚕", "🚙", "🚎", "🏎", "🚑", "🚌", "🚓",  "🚒", "🚐", "🛻", "🚚", "🚛" , "🚜"],
                                        color: .blue)
    private static let animals = Theme(name: "Animals",
                                       emojis: ["🐶", "🐱", "🐭", "🐰", "🦊", "🐼", "🐻", "🐻‍❄️",  "🐨", "🐸", "🦉", "🦋"],
                                       color: .green)
    private static let faces = Theme(name: "Faces",
                                     emojis: ["😋", "🥲", "😟", "😕", "🤩", "🙁", "😢", "🥺",  "😤", "🤯", "🤪", "🥶", "🤢", "🤠", "💩", "😶‍🌫️", "🤡", "👹", "👽", "🤖", "😼", "☠️"],
                                     color: .orange)

    // MARK: Other variables

    @Published private var model: MemoryGame<String>
    @Published var currentTheme: Theme
    var score: Int { model.score }
    var cards: [Card] { model.cards }

    init() {
        let randomTheme = avaliableThemes.randomElement()!
        let cardsContent = randomTheme.emojis.shuffled()
        self.model = MemoryGame<String>(avaliableCardContentPieces: cardsContent.count) { pairIndex in
            cardsContent[pairIndex]
        }
        self.currentTheme = randomTheme
    }

    // MARK: - Intent

    func choose(_ card: Card) {
        // Don't need if we have ObservableObject?
        //objectWillChange.send()
        model.choose(card)
    }

    func newGame() {
        let randomTheme = avaliableThemes.randomElement()!
        let cardsContent = randomTheme.emojis.shuffled()
        model = MemoryGame<String>(avaliableCardContentPieces: cardsContent.count) { pairIndex in
            cardsContent[pairIndex]
        }
        currentTheme = randomTheme
    }
    
}
