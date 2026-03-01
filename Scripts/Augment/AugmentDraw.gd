class_name AugmentDraw 

extends Augment

func _init():
	Name = "DRAW:"
	description ="AUGMENT: draws 1 card"

func play(enemy, player):
	player.draw(1)
