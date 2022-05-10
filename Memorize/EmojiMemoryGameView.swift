//
//  ContentView.swift
//  Memorize
//
//  Created by YesVladess on 18.12.2021.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var game: EmojiMemoryGame

    var body: some View {
        VStack {
            VStack {
                Text("Memorize!")
                    .padding(.bottom)
                    .font(.largeTitle)
                Spacer()
                AspectVGrid(items: game.cards, aspectRatio: DrawingConstants.cardsAspectRatio) { card in
                    cardView(for: card)
                }
            }
            Spacer()
            HStack(alignment: .firstTextBaseline, spacing: DrawingConstants.bottomElementsSpacing) {
                newGameButton.padding(.horizontal)
                gameInfoView.padding(.horizontal)
            }
            .padding(.horizontal)
        }
    }

    @ViewBuilder
    private func cardView(for card: EmojiMemoryGame.Card) -> some View {
        if card.isMatched && !card.isFaceUp {
            Rectangle().opacity(0)
        } else {
            CardView(card, withBackColor: game.currentTheme.color)
                .onTapGesture {
                    game.choose(card)
                }
                .padding(DrawingConstants.cardPadding)
        }
    }

    private var newGameButton: some View {
        Button {
            game.newGame()
        } label: {
            VStack {
                Image(systemName: "plus.rectangle.fill").font(.largeTitle)
                Text("New game")
            }
        }
    }

    private var gameInfoView: some View {
        VStack {
            Text("Theme: \(game.currentTheme.name)")
            Text("Points: \(game.score)")
        }
    }

    private struct DrawingConstants {
        static let cardsAspectRatio: CGFloat = 2/3
        static let cardPadding: CGFloat = 4
        static let bottomElementsSpacing: CGFloat = 25
    }

}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(game: game)
            .previewDevice("iPhone 13")
            .preferredColorScheme(.dark)
    }

}
