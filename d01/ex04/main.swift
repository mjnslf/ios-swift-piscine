var deck = Deck(mix: false)

print(deck)

for _ in 0...57 {
	if let card = deck.draw() {
		print("outs:\n\(deck.outs)")
		print("discards:\n\(deck.discards)")
		deck.fold(c:card)
		print("outs:\n\(deck.outs)")
		print("discards:\n\(deck.discards)\n")
	} else {
		print("nil")
	}
}

// for i in deck.cards {
// 	  print(i)
// }