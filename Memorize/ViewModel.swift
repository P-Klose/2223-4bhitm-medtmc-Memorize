//
//  ViewModel.swift
//  Memorize
//
//  Created by Peter Klose on 05.10.22.
//

import Foundation

class ViewModel: ObservableObject {
    typealias Card = Model<String>.Card
    static let emojis = ["🍎","🍐","🍊","🫐","🥭",""]
    
    @Published var model = Model(numberOfPairsofCards: 4) {emojis[$0]}
    var cards: [Card]{
        model.cards
    }
    
    func choose(_ card: Card){
        model.choose(card)
    }
}
