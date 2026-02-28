extends Node

# holds all the "decks"
var player_deck : Deck
var discard_deck : Deck
var player_hand: Deck
var enemy_deck : Deck

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_deck = Deck.PlayerDeck.new()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	


func _on_end_turn_pressed() -> void:
	for i in player_hand.deck_list.size():
		discard_deck.add_card(player_hand.Draw(player_hand.deck_list.size()))
	
