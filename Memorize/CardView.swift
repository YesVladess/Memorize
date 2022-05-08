//
//  CardView.swift
//  Memorize
//
//  Created by YesVladess on 08.05.2022.
//

import SwiftUI


struct CardView: View {

    private let card: EmojiMemoryGame.Card
    private let cardBackColor: Color

    init(_ card: EmojiMemoryGame.Card,
         withBackColor cardBackColor: Color) {
        self.card = card
        self.cardBackColor = cardBackColor
    }

    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp {
                    shape.fill(.gray)
                    Text(card.content)
                        .font(font(inSize: geometry.size))
                } else if card.isMatched {
                    shape.opacity(0)
                } else {
                    shape.fill(LinearGradient(colors: [cardBackColor, .white],
                                              startPoint: .top,
                                              endPoint: .bottom)
                    )
                    shape.strokeBorder(.blue, lineWidth: DrawingConstants.lineWidth)
                }
            }
        })
    }

    private func font(inSize size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScalingFactor)
    }

    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 20
        static let fontScalingFactor = 0.8
        static let lineWidth: CGFloat = 3
    }

}
