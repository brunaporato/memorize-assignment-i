//
//  MemorizeGame.swift
//  MemorizeAssignment
//
//  Created by Bruna Porato on 09/02/25.
//

import Foundation
import SwiftUI

class EmojiMemorizeGame: ObservableObject {
    private static let emojis = ["👻", "🦇", "🎃", "💀", "🕷️", "🧟‍♂️", "🕸️", "👹"]
    
    private static func createMemorizeGame() -> MemorizeGame<String> {
        return MemorizeGame(numberOfPairsOfCards: 8) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            }
            return "⁉️"
        }
    }
    
    @Published private var model = createMemorizeGame()
    
    var cards: Array<MemorizeGame<String>.Card> {
        print(model.cards)
        return model.cards
    }
    
    // MARK: - Intents
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemorizeGame<String>.Card) {
        model.choose(card)
    }
}
