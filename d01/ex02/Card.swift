import Foundation

class Card : NSObject {
    var color : Color
    var value : Value

    init(col : Color, val : Value) {
        color = col
        value = val
        super.init()
    }
    
    override var description: String {
        return ("Card \(value.rawValue) and color \(color.rawValue)")
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        if let object = object as? Card {
            return(self == object)
        } else {
            return false
        }
    }
}

func ==(first: Card, second: Card) -> Bool {
    return (first.color == second.color && first.value == second.value)
}
