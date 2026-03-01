class_name BaseCard

extends Panel

signal on_played(myself)

@onready var card_title: Label = %CardTitle
@onready var card_art: TextureRect = %CardArt
@onready var card_description: Label = %CardDescription
@onready var card_suit: Label = %CardSuit

const SOUND_GRAB_CARD = preload("uid://ssrut70qprqx")
const SOUND_PLAY_CARD = preload("uid://cu8lalsyuc5b")

var underlying_card : Card
var click_start_time : int = 0
var initial_mouse_offset : Vector2
func _ready() -> void:
	pass
	
func play_card(enemy, player):
	underlying_card.play(enemy, player)

func style_to_card(card : Card):
	underlying_card = card
	card_title.text = card.name
	if card.augment != null:
		card_description.text = card.description + "\n " + card.augment.description
	else:
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
			AudioPlayer.play_randomised(SOUND_GRAB_CARD)
			#print("pressed")
		if event.is_released():
			if Time.get_ticks_msec() - click_start_time <= 100 or position.y < -size.y * 0.5:
				on_played.emit(self)
				AudioPlayer.play_randomised(SOUND_PLAY_CARD)
				print("played!")
			else:
				AudioPlayer.play_randomised(SOUND_GRAB_CARD)
				print("failed to play")
				#position = Vector2(0,0)
				get_parent().visible = false
				get_parent().call_deferred("set_visible", true) #recalculated position from container!
				
			click_start_time = 0
			initial_mouse_offset = Vector2(0,0)
			#print("released")
	
	pass # Replace with function body.
