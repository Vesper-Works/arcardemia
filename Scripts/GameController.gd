class_name GameController
extends Node

@onready var state: String = "Cutscene"
@onready var PillarAnimator: AnimationPlayer = %BoxAnimator
@onready var CameraAnimator: AnimationPlayer = %PlayerAnimator
@onready var DogAnimator: AnimationPlayer = %CerberusAnimator
@onready var Loot: Control = %Loot
@onready var CardController: Control = %CardController
@onready var main_hud: Control = %MainHUD
@onready var player_deck: Deck = CardController.player_deck
@onready var Reward1 = null
@onready var Reward2 = null
@onready var Reward3 = null
@onready var deckcard1 = null
@onready var deckcard2 = null
@onready var enemy: Creature
var player: Creature = Player.new()

var loot_option: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#CameraAnimator.play("ZoomOnBox")
	#LootCutsceneStart()
	#enemy = Enemy.Cerberous.new()
	await get_tree().create_timer(1.0).timeout
	CardController.new_player_hand()
	main_hud.show_hand(CardController.player_hand.deck_list)
	CameraAnimator.play("ZoomOnBox")
	LootCutsceneStart()
	#enemy = Enemy.Cerberous.new()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func LootCutsceneStart():

	PillarAnimator.play("Raise")
	PillarAnimator.queue("Open")

	
func LootPhase():
	state = "Loot"
	%LootUI.visible = true
	#pick a card from the deck
	
	var deckcard1: Card = null
	var deckcard2: Card = null
	
	var Reward1: Card = null
	var Reward2: Card = null
	var Reward3: Card = Loot.generate_basic_card()
	
	if player_deck.has_basic():
		deckcard1 = player_deck.get_basic()
		Reward1 = Loot.generate_augment(deckcard1)
	else:
		Reward1 = Loot.generate_basic_card()
		
	if player_deck.has_basic():
		deckcard2 = player_deck.get_basic()
		Reward2 = Loot.generate_augment(deckcard2)
	else:
		Reward2 = Loot.generate_basic_card()
	

	#if deckcard1 != null:
	#	player_deck.add_card(deckcard1)
	#if deckcard2 != null:
	#	player_deck.add_card(deckcard2)
	
	%Option1Card.style_to_card(Reward1)
	%Option2Card.style_to_card(Reward2)
	%Option3Card.style_to_card(Reward3)
	

	
func _on_end_turn():
	main_hud.clear_hand()
	
	player.take_damage(enemy.strength)
	%HealthLabel.text = "Health: %d/%d" % [player.health, player.max_health]
	if player.health <= 0:
		play_death_animation()
		
	else:
		if enemy.health <= 0:
			LootCutsceneStart()
		else:
			CardController.new_player_hand()
			main_hud.show_hand(CardController.player_hand.deck_list)
	
func _on_card_play(played_card: Card):
	played_card.play(enemy, player)
	
func play_death_animation():
	print("dead, bleh.")
	battle_ui.visible = false
	Loot.visible = false

func LootCutsceneEnd():
	CameraAnimator.play_backwards("ZoomOnBox")	#PillarAnimator.play_backwards("Raise")
	PillarAnimator.play_backwards("Close")
	#SpawnEnemy
	
	state = "PlayerTurn"
	


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Open":
		LootPhase()
	if anim_name == "Close":
		PillarAnimator.play_backwards("Lower")
		DogAnimator.play("spawn")
		%Cerberus.visible = true
		CameraAnimator.play("ZoomOut")
		




func _on_loot_selected(option: int) -> void:
	print("option selected: ", option)
	%LootUI.visible = false
	
	match option:
		1: 
			player_deck.deck_list.append(Reward1)
			player_deck.deck_list.append(deckcard2)
		2:
			player_deck.deck_list.append(Reward2)
			player_deck.deck_list.append(deckcard1)
		3:
			player_deck.deck_list.append(deckcard1)
			player_deck.deck_list.append(deckcard2)
			player_deck.deck_list.append(Reward3)
			
	LootCutsceneEnd()


func _on_cerberus_animator_animation_finished(anim_name: StringName) -> void:
	%BattleUI.visible = true
