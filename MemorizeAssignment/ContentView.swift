//
//  ContentView.swift
//  MemorizeAssignment
//
//  Created by Bruna Porato on 01/02/25.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻", "🦇", "🎃", "💀", "🕷️", "🧟‍♂️"]
    
    var body: some View {
        VStack {
            ScrollView {
                cards
                cards
            }
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))], spacing: 8) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
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
