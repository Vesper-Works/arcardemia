extends Node

# holds all the "decks"
var player_deck : Deck
var discard_deck : Deck
var player_hand: Deck
var enemy_deck : Deck
var hand_size : int

signal hand_display

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_deck = Deck.PlayerDeck.new()
	hand_size = 5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	


func _on_end_turn_pressed() -> void:
	hand_display.emit("clear", player_hand)
	for i in player_hand.deck_list.size():
		discard_deck.add_card(player_hand.Draw(player_hand.deck_list.size()))
	if player_deck.deck_list.size() >= hand_size:
		player_hand.add_card(player_deck.draw(hand_size))
	else:
		var remaining = hand_size - player_deck.deck_list.size()
		player_hand.draw(player_deck.decklist.size())
	hand_display.emit("show", player_hand)
