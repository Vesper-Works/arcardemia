@abstract class_name Deck
# contains classes for the different types of decks

# the core deck list array
var deck_list : Array[Card]

# draws x cards from the deck, returns an array of cards if amount is specified.
# accepts int inputs and 2 string inputs (one / all)
# by default returns a single card not in an array
# can accept "all" as a command
func draw(amount = "one"):
	var returned : Array[Card]
	match typeof(amount):
		TYPE_STRING:
			match amount: 
				"all":
					for i in deck_list.size():
						returned.append(deck_list.pop_front())
				"one":
					return deck_list.pop_front()
				_:
					printerr("Unacceptable input in Deck.draw: '"+amount+"'")
					
		TYPE_INT:
			if amount <= deck_list.size():
				for i in amount:
					returned.append(deck_list.pop_front())
			elif amount > deck_list.size():
					printerr("Invalid DeckSize drawn")
					return deck_list.size()
			else:
				printerr("something went wrong in Deck.draw")
		_:
			printerr("Invalid type passed to Deck.draw: '" + amount + "'")
	return returned

func add_card(cards_to_add: Array[Card]):
	deck_list.append_array(cards_to_add)

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
		
	func has_basic() -> bool:
		for i in deck_list:
			if i.suit == Card.CardSuit.none:
				return true
				
		return false
		
	func get_basic() -> Card:
		var select: Card = null
		for i in deck_list:
			if i.suit == Card.CardSuit.none:
				var pos = deck_list.find(i)
				select = i
				deck_list.pop_at(pos)
				break
		
		return select
		
class Discard extends Deck:
	
	func view():
		for i in deck_list:
			print("the cards name is: " + i.name)

class PlayerHand extends Deck:
	
	func view():
		for i in deck_list:
			print("the cards name is: " + i.name)
