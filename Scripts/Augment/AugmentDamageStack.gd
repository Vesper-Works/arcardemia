class_name AugmentDamageStack

extends Augment
var times_played: int = 0

func _init():
	Name = "lightning rod:"

	
func play(enemy, player, suit):
	times_played += 1
	enemy.take_damage(5* suit * times_played)

func get_description() -> String:
	if attached_to == null:
		return "AUGMENT: Deals ??? damage each play."
	return "AUGMENT: Deals %d damage each play." % (5 * attached_to.suit)
