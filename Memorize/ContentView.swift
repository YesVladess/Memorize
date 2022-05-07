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
                        CardView(card: card).aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            Spacer()
            HStack( alignment: .firstTextBaseline, spacing: 25) {
                vehiclesThemeButton.padding(.horizontal)
                facesThemeButton.padding(.horizontal)
                animalsThemeButton.padding(.horizontal)
            }
        }
        .padding(.horizontal)
    }

    var vehiclesThemeButton: some View {
        Button {
            viewModel.restartGame(theme: .vehihles)
        } label: {
            VStack {
                Image(systemName: "car").font(.largeTitle)
                Text("Vehicles")
            }
        }
    }

    var facesThemeButton: some View {
        Button {
            viewModel.restartGame(theme: .faces)
        } label: {
            VStack {
                Image(systemName: "face.smiling")
                    .font(.largeTitle)
                Text("Faces")
            }
        }
    }

    var animalsThemeButton: some View {
        Button {
            viewModel.restartGame(theme: .animals)
        } label: {
            VStack() {
                Image(systemName: "hare")
                    .font(.largeTitle)
                Text("Animals")
            }
        }
    }

}

struct CardView: View {

    let card: MemoryGame<String>.Card

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
                shape.fill(.brown)
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
        //        ContentView()
        //            .previewDevice("iPhone 13")
        //            .preferredColorScheme(.light)
    }
}
