class_name GameController
extends Node

@onready var PillarAnimator: AnimationPlayer = %BoxAnimator
@onready var CameraAnimator: AnimationPlayer = %PlayerAnimator
@onready var Loot: Control = %Loot
@onready var main_hud: Control = $MainHUD
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
	var Option1: Augment = Loot.get_augment()
	
	var Option2: Card = Loot.get_basic_card()
	var Option3: Relic = Loot.get_relic()
	
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


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Open":
		LootPhase()
	if anim_name == "Close":
		PillarAnimator.play_backwards("Lower")
