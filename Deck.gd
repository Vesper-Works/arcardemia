@abstract class_name Deck
# contains classes for the different types of decks

# the core deck list array
var deck_list : Array[Card]

# draws x cards from the deck, returns a card 
func draw(amount: int = 1):
	var returned : Array[Card]
	match typeof(amount):
		TYPE_STRING:
			for i in deck_list.size():
				returned.append(deck_list.pop_front())
		TYPE_INT:
			if amount > 1 and amount <= deck_list.size():
				for i in amount:
					returned.append(deck_list.pop_front())
			elif amount > deck_list.size():
					printerr("Invalid DeckSize drawn")
					return deck_list.size()
			else:
				return deck_list.pop_front()
	return returned

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
