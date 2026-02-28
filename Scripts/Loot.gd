extends Node

var augment_pool: Array[Augment] 
var relic_pool: Array[Relic] 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func generate_loot():
	
	#one option should augment existing card
	#one option adds a new card
	#one option grants a global relic
	
	var option1: Augment = get_augment()
	var option2: Card = get_basic_card()
	var option3: Relic = get_relic()
	

func get_augment():
	return augment_pool.pick_random()
	
func get_relic():
	return relic_pool.pick_random()
	
func get_basic_card():
	
	var random = RandomNumberGenerator.new()
	var select = random.randi_range(1,2)
	
	if select == 1:
		return Card.BasicAttack.new()
		
	else:
		return Card.BasicDefend.new()
	
	
