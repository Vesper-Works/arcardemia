extends Control
# handles all visuals

@onready var draw_window: Control = $DrawWindow

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_draw_button_pressed() -> void:
	print("Button Pressed")
	if draw_window.visible:
		draw_window.visible = false
	else:
		draw_window.visible = true
	pass # Replace with function body.

func _on_card_controller_hand_display(command: String, deck: Array[Card]) -> void:
	pass # Replace with function body.
