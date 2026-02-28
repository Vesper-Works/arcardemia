@abstract class_name Card

enum CardType
{
	Damage,
	Defence
}
enum CardSuit
{
	Alpha,
	Beta,
	Gamma,
	Delta,
	Epsilon,
	Zeta,
	Eta,
	Theta,
	Iota,
	Kappa,
	Lambda,
	Mu
}

enum CardSuit
{
	Alpha,
	Beta,
	Gamma,
	Delta,
	Epsilon,
	Zeta,
	Eta,
	Theta,
	Iota,
	Kappa,
	Lambda,
	Mu
}

var name: String
var description : String
var texture : Texture2D
var type : CardType
var card_suit : CardSuit

@abstract func play(enemy, player)


class BasicAttack extends Card:
	func _init():
		name = "Attack"
		type = CardType.Damage
		texture = preload("uid://b02bqxg8taui5")
		
	func play(enemy, player):
		enemy.take_damage(10)
		
class BasicDefend extends Card:
	func _init():
		name = "Defend"
		type = CardType.Defence
		texture = preload("uid://d1ecyrmtogs7c")
		
	func play(enemy, player):
		player.shield(10)
		
