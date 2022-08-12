let card1 : Card = Card(col: Color.club, val: Value.jack)
let card2 : Card = Card(col: Color.heart, val: Value.ace)
let card3 : Card = Card(col: Color.club, val: Value.jack)
let card4 : Card = Card(col: Color.diamond, val: Value.ten)

print("Cards:")
print("\(card1)")
print("\(card2)")
print("\(card3)")
print("\(card4)")
print("--------override function-------")
print(card1.isEqual(card2))
print(card2.isEqual(card3))
print(card3.isEqual(card4))
print(card1.isEqual(card3))
print("--------overloaded operator---------")
print(card4 == card3)
print(card3 == card1)
print(card2 == card3)