class_name AugmentDamageStack

extends Augment
var times_played: int = 0

func _init():
	Name = "lightning rod:"
	description ="AUGMENT: Stacks 10 damage each play."
func play(enemy, player):
	times_played += 1
	enemy.takedamage(10*times_played)
