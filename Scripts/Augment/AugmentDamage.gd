class_name AugmentDamage

extends Augment

func _init():
	Name = "damage:"
	description ="AUGMENT: Deals 50 damage."

func play(enemy, player):
	enemy.take_damage(50)
	
