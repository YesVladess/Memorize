//
//  ContentView.swift
//  Memorize
//
//  Created by YesVladess on 18.12.2021.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🚗", "🚕", "🚙", "🚎", "🏎", "🚑", "🚌", "🚓",  "🚒", "🚐", "🛻", "🚚", "🚛" , "🚜"]
    @State var emojiCount: Int = 4
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns:
                            [GridItem(.adaptive(minimum: 65))]
                )
                {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                removeButton.padding(.horizontal)
                Spacer()
                addButton.padding(.horizontal)
            }.font(.largeTitle)
        }
        .padding(.horizontal)
    }

    var removeButton: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }

    var addButton: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }

}

struct CardView: View {

    var content: String
    @State var isFaceUp: Bool = true

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light
            )
    }
}
