@abstract class_name Creature

var health : int
var max_health : int
var shield : int = 0
var strength : int

# called when a player or enemy takes damage
func take_damage(amount):
	# first deals damage to the shield
	print("shield on takedamage: ", shield)
	if shield > 0:
		if amount >= shield:
			amount -= shield
			shield = 0
		else:
			amount = 0
			shield -= amount
	# then deals damage to the health
	if amount >= health:
		health = 0
	else:
		health -= amount

# adds shield to the creature
func gain_shield(amount):
	shield += amount

# heals the creature
func heal(amount):
	if health+amount >= max_health:
		health = max_health
	else:
		health += amount
