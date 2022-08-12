import Foundation

class Deck: NSObject {
    static let allSpades: [Card] = Value.allValues.map({Card(col : Color.spade, val : $0)})
    static let allDiamonds: [Card] = Value.allValues.map({Card(col : Color.diamond, val : $0)})
    static let allHearts: [Card] = Value.allValues.map({Card(col : Color.heart, val : $0)})
    static let allClubs: [Card] = Value.allValues.map({Card(col : Color.club, val : $0)})
    static let allCards: [Card] = allSpades + allDiamonds + allHearts + allClubs
}