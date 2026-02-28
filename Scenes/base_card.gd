extends Panel

@onready var card_title: Label = %CardTitle
@onready var card_art: TextureRect = %CardArt
@onready var card_description: Label = %CardDescription
@onready var card_suit: Label = %CardSuit

func style_to_card(card : Card):
	card_title.text = card.name
	card_description.text = card.description
	card_art.texture = card.texture
	match card.suit:
		
		Card.CardSuit.a:
			card_suit.text = "α"		
		Card.CardSuit.b:
			card_suit.text = "β"		
		Card.CardSuit.g:
			card_suit.text = "γ"
		Card.CardSuit.none:
			card_suit.text = ""	
	pass
