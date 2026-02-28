extends Panel

signal on_played(myself)

@onready var card_title: Label = %CardTitle
@onready var card_art: TextureRect = %CardArt
@onready var card_description: Label = %CardDescription
@onready var card_suit: Label = %CardSuit

var click_start_time : int = 0
var initial_mouse_offset : Vector2
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


func _on_gui_input(event: InputEvent) -> void:

	if event is InputEventMouse and click_start_time > 0:
		#if initial_mouse_offset == Vector2(0,0):
			#initial_mouse_offset = event.position
		global_position = event.global_position - initial_mouse_offset
	if event is InputEventMouseButton and event.button_index == MouseButton.MOUSE_BUTTON_LEFT:
		if event.is_pressed():
			click_start_time = Time.get_ticks_msec()
			initial_mouse_offset = get_local_mouse_position()
			#print("pressed")
		if event.is_released():
			if Time.get_ticks_msec() - click_start_time <= 100 or position.y < -size.y * 0.8:
				on_played.emit(self)
				print("played!")
			else:
				print("failed to play")
				#position = Vector2(0,0)
				visible = false
				call_deferred("set_visible", true) #recalculated position from container!
				
			click_start_time = 0
			initial_mouse_offset = Vector2(0,0)
			#print("released")
	
	pass # Replace with function body.
