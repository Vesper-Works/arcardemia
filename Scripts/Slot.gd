class_name CardSlot
extends Control

var card: Card = null


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("card_slots")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func has_card() -> bool:
	print("Has Card: ", card )
	return card != null
	
func set_card(new_card: Card) -> bool:
	if card != null:
		return false

	card = new_card
	
	return true
	#card.position = Vector2.ZERO  # snap to slot
	
func remove_card() -> Card:
	if card == null:
		return null

	var removed = card
	card = null
	return removed
