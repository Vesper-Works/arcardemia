extends Node


var augment_pool: Dictionary[int, Script] = {
#	1: AugmentDraw,
	2: AugmentDamageStack,
	3: AugmentShield,
	4: AugmentDamage
}

var letter_pool: Array[String] = ["a", "b", "g"]


func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	

func generate_augment(card: Card):
	var random = RandomNumberGenerator.new()
	
	var i = random.randi_range(1, augment_pool.size())
	var augment: Augment = augment_pool[i].new()
	
	card.augment = augment
	return card
		

#	var letter: String = letter_pool[letterpointer]
	
	#card.augment = augment
	
	#match letter:
	#	"a": card.suit = Card.CardSuit.a
	#	"b": card.suit = Card.CardSuit.b
	#	"g": card.suit = Card.CardSuit.g
#	print("card name at return: ", card.name)
	#return card
	

	
func generate_basic_card():
	
	var random = RandomNumberGenerator.new()
	var select = random.randi_range(1,2)
	
	if select == 1:
		return Card.BasicAttack.new()
		
	else:
		return Card.BasicDefend.new()
	
	
