class_name GameController
extends Node

@onready var state: String = "Cutscene"
@onready var PillarAnimator: AnimationPlayer = %BoxAnimator
@onready var CameraAnimator: AnimationPlayer = %PlayerAnimator
@onready var Loot: Control = %Loot
@onready var main_hud: Control = %MainHUD
@onready var CardController: Control = %CardController
@onready var player_deck: Deck = CardController.player_deck
@onready var card_controller: Node = $MainHUD/CardController

var enemy: Creature
var player: Creature = Player.new()

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
	main_hud.visible = true
	state = "Loot"
	#pick a card from the deck
	
	var deckcard1: Card = null
	var deckcard2: Card = null
	
	if !player_deck.has_basic():
		deckcard1 = Loot.get_basic_card()
	else:
		deckcard1 = player_deck.get_basic()

	if !player_deck.has_basic():
		deckcard2 = Loot.get_basic_card()
	else:
		deckcard2= player_deck.get_basic()
		
	#set rewards
	var Reward1: Card = Loot.get_augment(deckcard1)
	var Reward2: Card = Loot.get_augment(deckcard2)
	var Reward3: Card = Loot.get_basic_card()
	
	%Option1Card.style_to_card(Reward1)
	%Option2Card.style_to_card(Reward2)
	%Option3Card.style_to_card(Reward3)
	

	
func _on_end_turn():
	main_hud.clear_hand()
	card_controller.new_player_hand()
	
	player.take_damage(enemy.strength)
	if player.health <= 0:
		play_death_animation()
		
	else:
		if enemy.health <= 0:
			LootCutsceneStart()
		main_hud.show_hand(card_controller.player_hand.deck_list)
	
func _on_card_play(played_card: Card):
	played_card.play(enemy, player)
	
func play_death_animation():
	print("dead, bleh.")

func LootCutsceneEnd():
	CameraAnimator.play_backwards("ZoomOnBox")	#PillarAnimator.play_backwards("Raise")
	PillarAnimator.play_backwards("Close")
	%HandZone.visible = true
	%EndTurn.visible = true


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Open":
		LootPhase()
	if anim_name == "Close":
		PillarAnimator.play_backwards("Lower")
