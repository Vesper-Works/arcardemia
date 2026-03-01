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
var Reward1: Card
var Reward2: Card
var Reward3: Card
var deckcard1: Card
var deckcard2: Card
@onready var enemy: Creature
@onready var battle_ui: Control = %BattleUI

var player: Creature = Player.new()

var loot_option: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	CameraAnimator.play("ZoomOnBox")
	LootCutsceneStart()
	enemy = Enemy.Cerberous.new()
	

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
	
	#reset options
	deckcard1 = null
	deckcard2 = null
	Reward1 = null
	Reward2 = null
	Reward3 = Loot.generate_basic_card()
	
	#option 1 tries to upgrade a card: returns new basic if false
	
	#check if player deck has a basic card to upgrade
	if player_deck.has_basic():
		deckcard1 = player_deck.get_basic() #retrieve and pop card from deck
		Reward1 = Loot.generate_augment(deckcard1) #give it an augment
		Reward1.upgrade_suit()
	else: # generate a new basic card
		deckcard1 = Loot.generate_basic_card()
		Reward1 = deckcard1

		
	
	#option 2 tries to upgrade an augment, returns basic augment if false

	#check if player deck has an augmented card
	if player_deck.has_augment():
		deckcard2 = player_deck.get_augmented()
		Reward2 = deckcard2
		Reward2.upgrade_suit()
	else:
		if player_deck.has_basic():
			deckcard2 = player_deck.get_basic() #retrieve and pop card from deck
			Reward2 = Loot.generate_augment(deckcard2) #give it an augment
			Reward2.upgrade_suit()
		
		else:
			Reward2 = Loot.generate_basic_card()
			
			
		Reward3 = Loot.generate_basic_card() # option 3 is always a basic card

	print("Reward1: ", Reward1)
	print("Reward1: ", Reward2)
	print("Reward1: ", Reward3)
	
	%Option1Card.style_to_card(Reward1)
	%Option2Card.style_to_card(Reward2)
	%Option3Card.style_to_card(Reward3)
	
	return
	
func _on_end_turn():
	main_hud.clear_hand()
	
	if player.health <= 0:
		play_death_animation()
		
	else:
		if enemy.health <= 0:
			LootCutsceneStart()
		else:
			player.take_damage(enemy.strength)
			%HealthLabel.text = "Health: %d/%d" % [player.health, player.max_health]
			CardController.new_player_hand()
			main_hud.show_hand(CardController.player_hand.deck_list)
	
func _on_card_play(played_card: Card):
	played_card.play(enemy, player)
	
func play_death_animation():
	print("dead, bleh.")
	battle_ui.visible = false
	Loot.visible = false
	%DeathScreen.visible = true

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
		




func _on_loot_selected(option: int):
	print("option selected: ", option)

	
	match option:
		1: 
			print("Reward1 inserted: ", Reward1)
			player_deck.deck_list.append(Reward1)
			
			if deckcard2 != null:
				player_deck.deck_list.append(deckcard2)
		2:
			player_deck.deck_list.append(Reward2)
			if deckcard1 != null:
				player_deck.deck_list.append(deckcard1)
		3:
			print("deckcard1 inserted: ", deckcard1)
			player_deck.deck_list.append(deckcard1)
			player_deck.deck_list.append(deckcard2)
			player_deck.deck_list.append(Reward3)
		

	for i in player_deck.deck_list:
		print("card in deck:", i)
		
	%LootUI.visible = false
	LootCutsceneEnd()


func _on_cerberus_animator_animation_finished(anim_name: StringName) -> void:
	%BattleUI.visible = true
	CardController.new_player_hand()
	main_hud.show_hand(CardController.player_hand.deck_list)



func _on_card_played(card_to_play: BaseCard) -> void:
	card_to_play.play_card(enemy,player)
	CardController.discard(card_to_play.underlying_card)
	print("Discard:", CardController.discard_deck.deck_list.size())
	card_to_play.get_parent().visible = false

func _on_card_on_played(myself: Variant) -> void:
	_on_card_played(myself)
