@abstract class_name Card

enum CardType
{
	Damage,
	Defence
}

var name: String
var description : String
var texture : Texture2D
var type : CardType
@abstract func play(enemy, player)


class BasicAttack extends Card:
	func _init():
		name = "Attack"
		texture = preload("uid://b02bqxg8taui5")
		
	func play(enemy, player):
		enemy.take_damage(10)
		
class BasicDefend extends Card:
	func _init():
		name = "Defend"
		texture = preload("uid://d1ecyrmtogs7c")
		
	func play(enemy, player):
		player.shield(10)
