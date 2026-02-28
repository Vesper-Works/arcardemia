class_name Augment
extends Node

var Name: AugmentList

enum AugmentList
{
	none,
	Draw3,
	DoubleDamage
}

	
func select_name(select: int):
	self.Name = AugmentList.values()[select]
