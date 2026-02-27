extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

class Deck:
	# holds the current deck contents
	var deck_contents: Array[Card]
	
	# creates a deck based on the type to create
	func create_deck(deck_type:String, enemy_type: String = ""):
		var card_list: Array[String]
		match deck_type:
			"player":
				for i in 5:
					if i >= 3:
						card_list.append("attack")
					else:
						card_list.append("Defend")
			"enemy":
				deck_contents.append("that")
		for i in card_list:
			var temp_card = Card.BasicAttack.new()
			temp_card.generate_card(i)
			deck_contents.append(temp_card)
		deck_contents.shuffle()
		
	func get_card():
		var return_card: Card = deck_contents.pop_front() 
		
	func shuffle():
		deck_contents.shuffle()
	
	func add_card(added_card: Card):
		deck_contents.append(added_card)
		
	func add_cards(added_cards: Array[Card]):
		deck_contents.append_array(added_cards)
