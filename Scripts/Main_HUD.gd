extends Control
# handles all visuals

@onready var controller: Node = $CardController
@onready var draw_window: Control = $DrawWindow
@onready var discard_window: Control = $DiscardWindow
@onready var card_slots: Array[Button] = [$HandZone/CardSlot1, $HandZone/CardSlot2, $HandZone/CardSlot3, $HandZone/CardSlot4, $HandZone/CardSlot5, $HandZone/CardSlot6, $HandZone/CardSlot7, $HandZone/CardSlot8]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_draw_button_pressed() -> void:
	print("Draw Button Pressed")
	
	if draw_window.visible:
		draw_window.visible = false
	else:
		if discard_window.visible:
			discard_window.visible = false
		draw_window.visible = true
		for i in controller.player_deck.deck_list:
			print(i.name)
	pass # Replace with function body.


func add_card_to_hand(card_to_show: Card):
	for i in card_slots:
		if not i.visible:
			i.icon = card_to_show.texture
			return true
	return false
