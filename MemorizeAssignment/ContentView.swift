//
//  ContentView.swift
//  MemorizeAssignment
//
//  Created by Bruna Porato on 01/02/25.
//

import SwiftUI

struct ContentView: View {
    let halloweenEmojis = ["👻", "🦇", "🎃", "💀", "🕷️", "🧟‍♂️", "🕸️", "👹"]
    let pinkEmojis = ["🧞‍♀️", "🎀", "👛", "🌷", "🦩", "🎟️", "💘", "💕"]
    let carsEmojis = ["🚗", "🚘", "🚙", "🚓", "🚔", "🚕", "🚖", "🏎️"]
    
    @State var emojis: [String] = ["👻", "🦇", "🎃", "💀", "🕷️", "🧟‍♂️", "🕸️", "👹"]
        
    @State var currentColor = Color.orange
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
                .foregroundColor(currentColor)
                .fontWeight(.black)
            
            ScrollView {
                cards
                cards
            }
            
            themes
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 8) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(currentColor)
    }
    
    func themeButton(themeName: String) -> some View {
        Button(action: {
            switch themeName {
            case "Halloween":
                currentColor = Color.orange
                emojis = halloweenEmojis
            case "Pink":
                currentColor = Color.pink
                emojis = pinkEmojis
            case "Cars":
                currentColor = Color.blue
                emojis = carsEmojis
            default:
                currentColor = Color.orange
                emojis = halloweenEmojis
            }
        },label: {
            Text(themeName)
        })
    }
    
    var themes: some View {
        HStack {
            themeButton(themeName: "Halloween")
            Spacer()
            themeButton(themeName: "Pink")
            Spacer()
            themeButton(themeName: "Cars")
        }
        .padding()
    }
}

struct CardView: View {
    let content: String
    
    @State var isFaceUp = true
    
    let base = RoundedRectangle(cornerRadius: 12)
    
    var body: some View {
        ZStack {
            Group {
                base.strokeBorder(lineWidth: 4)
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
            
            base.opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
