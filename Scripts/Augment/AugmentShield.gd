class_name AugmentShield

extends Augment

func _init():
	Name = "shield:"
	description ="AUGMENT: adds 10 shield."
func play(enemy, player):
	player.gain_shield(10)
