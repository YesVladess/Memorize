//
//  MemoryGame.swift.swift
//  Memorize
//
//  Created by YesVladess on 26.12.2021.
//

import Foundation

// This is model
struct MemoryGame<CardContent> {

    private(set) var cards: [Card]

    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = [Card]()
        // add numberOfPairsOfCards x 2 cards to card array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2 + 1))
        }
    }

    mutating func choose(_ card: Card) {
        cards[index(of: card)].isFaceUp.toggle()
    }

    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0
    }

    struct Card: Identifiable {

        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent

        var id: Int
        
    }

}
