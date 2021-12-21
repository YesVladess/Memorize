//
//  ContentView.swift
//  Memorize
//
//  Created by YesVladess on 18.12.2021.
//

import SwiftUI

struct ContentView: View {

    @State var emojis = ["🚗", "🚕", "🚙", "🚎"]
    var emojisCount: Int {
        get {
            Int.random(in: 4 ... emojis.count)
        }
    }

    let emojisVehihles = ["🚗", "🚕", "🚙", "🚎", "🏎", "🚑", "🚌", "🚓",  "🚒", "🚐", "🛻", "🚚", "🚛" , "🚜"]
    let emojisAnimals = ["🐶", "🐱", "🐭", "🐰", "🦊", "🐼", "🐻", "🐻‍❄️",  "🐨", "🐸", "🦉", "🦋"]
    let emojisFaces = ["😋", "🥲", "😟", "😕", "🤩", "🙁", "😢", "🥺",  "😤", "🤯"]


    var body: some View {
        VStack {
            Text("Memorize!")
                .padding(.bottom)
                .font(.largeTitle)
            Spacer()
            ScrollView {
                LazyVGrid(columns:
                            [GridItem(.adaptive(minimum: 65))]
                )
                {
                    ForEach(emojis[0..<emojisCount],
                            id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
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
        .onAppear {
            emojis = emojisVehihles
        }
    }

    var vehiclesThemeButton: some View {
        Button {
            emojis = emojisVehihles.shuffled()
        } label: {
            VStack {
                Image(systemName: "car").font(.largeTitle)
                Text("Vehicles")
            }
        }
    }

    var facesThemeButton: some View {
        Button {
            emojis = emojisFaces.shuffled()
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
            emojis = emojisAnimals.shuffled()
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

    var content: String
    @State var isFaceUp: Bool = true

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill(.gray)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape.fill(.brown)
                shape.strokeBorder(.blue, lineWidth: 5)
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

