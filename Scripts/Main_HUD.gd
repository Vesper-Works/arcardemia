extends Control
# handles all visuals

@onready var controller: Node = $CardController
@onready var draw_window: Control = $DrawWindow
@onready var discard_window: Control = $DiscardWindow
@onready var card_slots: Array[Button] = [$BattleUI/HandZone/CardSlot1, $BattleUI/HandZone/CardSlot2, $BattleUI/HandZone/CardSlot3, $BattleUI/HandZone/CardSlot4, $BattleUI/HandZone/CardSlot5, $BattleUI/HandZone/CardSlot6, $BattleUI/HandZone/CardSlot7, $BattleUI/HandZone/CardSlot8]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Main_HUD ready")
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

func show_hand(cards_to_show: Array[Card]):
	for i in cards_to_show:
		add_card_to_hand(i)

func add_card_to_hand(card_to_show: Card):
	for i in card_slots:
		if not i.visible:
			i.get_child(0).style_to_card(card_to_show)
			i.visible = true
			return true
	return false
