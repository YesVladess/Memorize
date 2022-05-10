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
                    shape.fill().foregroundColor(.white)
                    Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90))
                        .padding(DrawingConstants.cirlePadding)
                        .opacity(DrawingConstants.circleOpacity)
                        .foregroundColor(.red)
                    Text(card.content)
                        .font(font(inSize: geometry.size))
                } else {
                    shape.fill(LinearGradient(colors: [cardBackColor, .white],
                                              startPoint: .top,
                                              endPoint: .bottom)
                    )
                    shape.strokeBorder(cardBackColor, lineWidth: DrawingConstants.lineWidth)
                }
            }
        })
    }

    private func font(inSize size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScalingFactor)
    }

    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let fontScalingFactor = 0.7
        static let lineWidth: CGFloat = 3
        static let cirlePadding: CGFloat = 4
        static let circleOpacity = 0.5
    }

}
