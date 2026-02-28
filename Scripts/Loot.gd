extends Node

var augment_pool: Array[Augment]
var relic_pool: Array[Relic] 
var letter_pool: Array[String] = ["a", "b", "g"]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	#should only be called once on startup
	generate_augment_pool()
	generate_relic_pool()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
#func generate_loot():
	
	#one option should augment existing card
	#one option adds a new card
	#one option grants a global relic
	
	#var option1: Augment = get_augment()
	#var option2: Card = get_basic_card()
	#var option3: Relic = get_relic()
	

func get_augment(card: Card):
	var random = RandomNumberGenerator.new()
	var augmentpointer = random.randi_range(1, augment_pool.size() - 1)
	var letterpointer = random.randi_range(1, letter_pool.size() - 1)
	
	if augment_pool.size() == 0:
		print("Augment Pool Empty")
		return card
		
	var augment: Augment = augment_pool[augmentpointer]
	var letter: String = letter_pool[letterpointer]
	
	card.augment = augment
	
	match letter:
		"a": card.suit = Card.CardSuit.a
		"b": card.suit = Card.CardSuit.b
		"g": card.suit = Card.CardSuit.g
	return card
	
func get_relic():
	return relic_pool.pick_random()
	
func get_basic_card():
	
	var random = RandomNumberGenerator.new()
	var select = random.randi_range(1,2)
	
	if select == 1:
		return Card.BasicAttack.new()
		
	else:
		return Card.BasicDefend.new()
	
	
func generate_augment_pool():
	for value in Augment.AugmentList.values():
		var augment = Augment.new()
		augment.Name = value
		augment_pool.append(augment)

func generate_relic_pool():
	for i in relic_pool.size():
		var relic = Relic.new()
		relic.RelicName = relic.select_name(i)
		relic_pool.append(relic)
