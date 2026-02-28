extends Node

var Queue: Array[Card] = []


func add_to_queue(card: Card):
		Queue.append(card)
		
func remove_from_queue(pos: int):
	var card = Queue[pos]
	Queue.pop_at(pos)
	return card
