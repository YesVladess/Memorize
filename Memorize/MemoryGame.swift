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
    private(set) var score = 0
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp}).oneAndOnly }
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) } }
    }

    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        var previouslySeen = false
        let content: CardContent
        let id: Int
    }

    init(avaliableCardContentPieces: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        var randomNumberOfPairs = Int.random(in: 8...15)
        if randomNumberOfPairs > avaliableCardContentPieces {
            randomNumberOfPairs = avaliableCardContentPieces
        }
        // add randomNumberOfPairs x 2 cards to card array
        for pairIndex in 0..<randomNumberOfPairs {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        cards.shuffle()
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
                score += 2
            } else {
                if cards[chosenIndex].previouslySeen == true {
                    score -= 1
                }
                if cards[potentialMatchIndex].previouslySeen == true {
                    score -= 1
                }
                cards[potentialMatchIndex].previouslySeen = true
                cards[chosenIndex].previouslySeen = true
            }
            cards[chosenIndex].isFaceUp = true
        } else {
            indexOfOneAndOnlyFaceUpCard = chosenIndex
        }
    }

}

extension Array {

    var oneAndOnly: Element? {
        self.count == 1 ? self.first : nil
    }
    
}
