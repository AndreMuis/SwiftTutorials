import UIKit

// nested types in action

struct PlayingCard {
    enum Suit: CaseIterable {
        case spades, hearts, diamonds, clubs
    }
    
    func printSuits() {
        for suit in Suit.allCases {
            print(suit)
        }
    }
}

let card = PlayingCard()
card.printSuits()

// referring to nested types

print(PlayingCard.Suit.spades)
