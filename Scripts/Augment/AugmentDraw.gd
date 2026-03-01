class_name AugmentDraw 

extends Augment

func _init():
	Name = "DRAW:"


func play(enemy, player, suit):
	pass

func get_description() -> String:
	if attached_to == null:
		return "AUGMENT: Deals ??? damage."
	return "AUGMENT: Draws %d cards." % (1 * attached_to.suit)
