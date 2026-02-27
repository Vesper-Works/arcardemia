extends Node

var player_deck : Deck

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_deck = Deck.PlayerDeck.new()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
