@abstract class_name Augment
extends Node


var Name
var description 
var Grade
var attached_to: Card

@abstract func play(enemy, player, suit)
@abstract func get_description() -> String
