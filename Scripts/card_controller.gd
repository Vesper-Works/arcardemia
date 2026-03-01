
extends Node

var player_deck : Deck
var discard_deck : Deck
var player_hand: Deck
var enemy_deck : Deck
var hand_size : int

signal hand_display


var slots: Array[CardSlot] 


#var player_hand: Hand

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_deck = Deck.PlayerDeck.new()
	hand_size = 5
	player_hand = Deck.PlayerHand.new()
	discard_deck = Deck.Discard.new()

	#$"../DrawButton".icon = player_deck.view()
	#slots = [$"../CardSlots/Slot1", $"../CardSlots/Slot2"]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	


func new_player_hand() -> void:
	
	discard_deck.add_card(player_hand.draw("all"))
	
	if player_deck.deck_list.size() >= hand_size:
		player_hand.add_card(player_deck.draw(hand_size))
		
	else:
		
		var remaining = hand_size - player_deck.deck_list.size()
		player_hand.add_card(player_deck.draw(player_deck.deck_list.size()))
		
		if not discard_deck.deck_list.is_empty():
			player_deck.add_card(discard_deck.draw("all"))
			
			if player_deck.deck_list.size() <= remaining:
				player_hand.add_card(player_deck.draw(remaining))
				
			else:
				player_hand.add_card(player_deck.draw(player_deck.deck_list.size()))

func _on_played(card: Card):
	pass
#func DrawCards():
	
	#var empty_slots: Array[CardSlot] = []
	#for slot in slots:
	#	if not slot.has_card():
	#		empty_slots.append(slot)
			
	#print("Empty slots", empty_slots.size())
	#if empty_slots.is_empty():
	#	return
	
#	var new: Array[Card] = player_deck.draw(1)
#	print("Cards drawn:", new)
	
#	for i in range(min(empty_slots.size(), new.size())):
#		empty_slots[i].set_card(new[i])

#func addHandToQueue()
#	select = pointer
#	Hand.Remove(select)
#	Queue.Add(select)
	
#func addQueueToHAnd()

#	select = pointer
#		Queue.Add(select)
#	Hand.Remove(select)
