import Foundation

class Deck: NSObject {
    static let allSpades: [Card] = Value.allValues.map({Card(col : Color.spade, val : $0)})
    static let allDiamonds: [Card] = Value.allValues.map({Card(col : Color.diamond, val : $0)})
    static let allHearts: [Card] = Value.allValues.map({Card(col : Color.heart, val : $0)})
    static let allClubs: [Card] = Value.allValues.map({Card(col : Color.club, val : $0)})
    static let allCards: [Card] = allSpades + allDiamonds + allHearts + allClubs
}

extension Array {
    mutating func Deck_mix() {
        for i in 0..<self.count {
            let index = Int(arc4random_uniform(UInt32(self.count)))
                self.swapAt(i, index)
        }
    }
}