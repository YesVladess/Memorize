//
//  MemoryGame.swift.swift
//  Memorize
//
//  Created by YesVladess on 26.12.2021.
//

import Foundation

// This is model
struct MemoryGame<CardContent> where CardContent: Equatable {

    private(set) var cards: [Card]

    private var indexOfOneAndOnlyFaceUpCard: Int?

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
        guard let chosenIndex = cards.firstIndex(where: {card.id == $0.id }),
              !cards[chosenIndex].isFaceUp,
              !cards[chosenIndex].isMatched
        else { return }

        if let potentialMatchIndex = indexOfOneAndOnlyFaceUpCard {
            if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                cards[chosenIndex].isMatched = true
                cards[potentialMatchIndex].isMatched = true
            }
            indexOfOneAndOnlyFaceUpCard = nil
        } else {
            for index in cards.indices {
                cards[index].isFaceUp = false
            }
            indexOfOneAndOnlyFaceUpCard = chosenIndex
        }
        cards[chosenIndex].isFaceUp.toggle()
    }

    struct Card: Identifiable {

        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent

        var id: Int
        
    }

}
