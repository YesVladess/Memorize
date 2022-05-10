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
            Text("Memorize!")
                .padding(.bottom)
                .font(.largeTitle)
            Spacer()
            AspectVGrid(items: game.cards, aspectRatio: 2/3, content: { card in
                CardView(card, withBackColor: game.currentTheme.color)
                    .onTapGesture {
                        game.choose(card)
                    }
                    .padding(4)
            })
            Spacer()
            HStack( alignment: .firstTextBaseline, spacing: 25) {
                newGameButton.padding(.horizontal)
                gameInfoView.padding(.horizontal)
            }
        }
        .padding(.horizontal)
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

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .previewDevice("iPhone 13")
            .preferredColorScheme(.dark)
    }
}
