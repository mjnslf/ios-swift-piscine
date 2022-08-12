import Foundation

class Deck: NSObject {
    static let allSpades: [Card] = Value.allValues.map({Card(col : Color.spade, val : $0)})
    static let allDiamonds: [Card] = Value.allValues.map({Card(col : Color.diamond, val : $0)})
    static let allHearts: [Card] = Value.allValues.map({Card(col : Color.heart, val : $0)})
    static let allClubs: [Card] = Value.allValues.map({Card(col : Color.club, val : $0)})

    static let allCards: [Card] = allSpades + allDiamonds + allHearts + allClubs

    var cards : [Card] = allCards
    var discards : [Card] = []
    var outs : [Card] = []

     init(mix: Bool) {
        if mix {
            self.cards.Deck_mix()
        }
        super.init()
    }
    
    override var description: String {
		return (self.cards.description)
	}

    func draw() -> Card? {
        if !cards.isEmpty {
        let first = cards[0]
        cards.remove(at: 0)
        outs.append(first)
        return first
        }
        return nil
    }
    
    func fold(c: Card) {
        for i in 0..<outs.count {
            if c == outs[i] {
                outs.remove(at:i)
                discards.append(c)
            }
        }
    }
}

extension Array {
    mutating func Deck_mix() {
        for i in 0..<self.count {
            let index = Int(arc4random_uniform(UInt32(self.count)))
                self.swapAt(i, index)
        }
    }
}