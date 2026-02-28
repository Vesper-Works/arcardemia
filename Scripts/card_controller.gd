
extends Node

var player_deck : Deck
@export_group("Card Slots")
@onready var slot_1: Control = $"../CardSlots/Slot1"
@onready var slot_2: Control = $"../CardSlots/Slot2"

var slots: Array[CardSlot] 


#var player_hand: Hand

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_deck = Deck.PlayerDeck.new()
	#$"../DrawButton".icon = player_deck.view()
	slots = [$"../CardSlots/Slot1", $"../CardSlots/Slot2"]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func DrawCards():
	
	var empty_slots: Array[CardSlot] = []
	for slot in slots:
		if not slot.has_card():
			empty_slots.append(slot)
			
	print("Empty slots", empty_slots.size())
	if empty_slots.is_empty():
		return
	
	var new: Array[Card] = player_deck.draw(1)
	print("Cards drawn:", new)
	
	for i in range(min(empty_slots.size(), new.size())):
		empty_slots[i].set_card(new[i])

#func addHandToQueue()
#	select = pointer
#	Hand.Remove(select)
#	Queue.Add(select)
	
#func addQueueToHAnd()

#	select = pointer
#		Queue.Add(select)
#	Hand.Remove(select)
