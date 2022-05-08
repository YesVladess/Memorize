//
//  ContentView.swift
//  Memorize
//
//  Created by YesVladess on 18.12.2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame

    var body: some View {
        VStack {
            Text("Memorize!")
                .padding(.bottom)
                .font(.largeTitle)
            Spacer()
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))])
                {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card,
                                 cardBackColor: viewModel.currentTheme.color)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                    }
                }
            }
            Spacer()
            HStack( alignment: .firstTextBaseline, spacing: 25) {
                newGameButton.padding(.horizontal)
                gameInfoView.padding(.horizontal)
            }
        }
        .padding(.horizontal)
    }

    var newGameButton: some View {
        Button {
            viewModel.newGame()
        } label: {
            VStack {
                Image(systemName: "plus.rectangle.fill").font(.largeTitle)
                Text("New game")
            }
        }
    }

    var gameInfoView: some View {
        VStack {
            Text("Theme: \(viewModel.currentTheme.name)")
            Text("Points: \(viewModel.score)")
        }

    }

}

struct CardView: View {

    let card: MemoryGame<String>.Card
    let cardBackColor: Color

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill(.gray)
                Text(card.content)
                    .font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill(LinearGradient(colors: [cardBackColor, .white],
                                          startPoint: .top,
                                          endPoint: .bottom)
                )
                shape.strokeBorder(.blue, lineWidth: 5)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
        .previewDevice("iPhone 13")
        .preferredColorScheme(.dark)
    }
}
