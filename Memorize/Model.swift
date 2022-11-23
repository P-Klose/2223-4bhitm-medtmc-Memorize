//
//  Model.swift
//  Memorize
//
//  Created by Peter Klose on 05.10.22.
//

import Foundation

struct Model <ContentType>{
    private(set) var cards: [Card]
    
    init(numberOfPairsofCards: Int, content: (Int) -> ContentType) {
        cards = []
        for pairIndex in 0..<numberOfPairsofCards{
            cards.append(Card(id: pairIndex * 2, content: content(pairIndex)))
            cards.append(Card(id: pairIndex * 2 + 1, content: content(pairIndex)))
        }
//        cards[0].isFaceUp = false
        cards.shuffle()
        
    }
 
    struct Card: Identifiable {
        var id: Int
        var content: ContentType
        var isFaceUp = false
        var isMached = false
        
    }
    
    mutating func choose(_ chosenCard: Card){
        print("Karte umdrehen \(chosenCard)")
        let indexOfCard = cards.indices.first {cards[$0].id==chosenCard.id
        }
        if let indexOfCard = indexOfCard {
            cards[indexOfCard].isFaceUp.toggle()
        }
    
    }
    
    func index(of card: Card) -> Int? {
        var foundAtIndex: Int?
        for index in 0..<cards.count {
            if card.id == cards[index].id{
                foundAtIndex = index
            }
        }
        return foundAtIndex
    }
}
