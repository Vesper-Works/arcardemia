@abstract class_name Deck

var deck_list : Array[Card]

func draw(amount: int = 1):
	var returned : Array[Card]
	for i in amount:
		returned.append(deck_list.pop_front())

@abstract func view()

class PlayerDeck extends Deck:
	
	func _init():
		for i in 5:
			if i >= 3:
				deck_list.append(Card.BasicAttack.new())
			else:
				deck_list.append(Card.BasicDefend.new())
		deck_list.shuffle()
	func view():
		return deck_list[0].texture

class Discard extends Deck:
	
	func view():
		for i in deck_list:
			print("the cards name is: " + i.name)
