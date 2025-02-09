//
//  MemorizeAssignmentApp.swift
//  MemorizeAssignment
//
//  Created by Bruna Porato on 01/02/25.
//

import SwiftUI

@main
struct MemorizeAssignmentApp: App {
    @StateObject var game = EmojiMemorizeGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemorizeGameView(viewModel: game)
        }
    }
}
