@abstract class_name Card

enum CardType
{
	Damage,
	Defence
}
enum CardSuit
{   
	none, a, b, g
}


var name: String
var description : String
var texture : Texture2D
var type : CardType
var suit: CardSuit = CardSuit.none
var augment: Augment

func upgrade_suit():
	var next := suit + 1
	if next > CardSuit.g:
		return false
	self.suit = next
	return
	
@abstract func play(enemy, player)


class BasicAttack extends Card:
	func _init():
		name = "Attack"
		type = CardType.Damage
		description = "This card does 50 damage"
		texture = preload("uid://b02bqxg8taui5")
		
	func play(enemy, player):
		enemy.take_damage(10)
		if augment != null:
			augment.play(enemy, player)
		
class BasicDefend extends Card:
	func _init():
		name = "Defend"
		type = CardType.Defence
		description = "This card blocks 5 damage"
		texture = preload("uid://d1ecyrmtogs7c")
		
	func play(enemy, player):
		player.gain_shield(10)
		if augment != null:
			augment.play(enemy, player)
		
