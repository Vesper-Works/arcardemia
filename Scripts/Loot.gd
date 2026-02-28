extends Node

var augment_pool: Array[Augment] 
var relic_pool: Array[Relic] 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	#should only be called once on startup
	generate_augment_pool()
	generate_relic_pool()

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
	
	
func generate_augment_pool():
	for i in augment_pool.size():
		var augment = Augment.new()
		augment.AugmentName = augment.select_name(i)
		augment_pool.append(augment)

func generate_relic_pool():
	for i in relic_pool.size():
		var relic = Relic.new()
		relic.RelicName = relic.select_name(i)
		relic_pool.append(relic)
