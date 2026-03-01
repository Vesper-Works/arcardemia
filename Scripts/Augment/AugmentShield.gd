class_name AugmentShield

extends Augment

func _init():
	Name = "shield:"

func play(enemy, player, suit):
	player.gain_shield(10 * suit)

func get_description() -> String:
	if attached_to == null:
		return "AUGMENT: Deals ??? damage."
	return "AUGMENT: applies %d shield." % (10 * attached_to.suit)
