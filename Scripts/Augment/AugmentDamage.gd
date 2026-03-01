class_name AugmentDamage

extends Augment

func _init():
	Name = "damage:"

func play(enemy, player, suit):
	enemy.takedamage(25*suit)
	
func get_description() -> String:
	if attached_to == null:
		return "AUGMENT: Deals ??? damage."
	return "AUGMENT: Deals %d damage." % (25 * attached_to.suit)
