@abstract class_name Relic
extends Node

var Name: RelicList
enum RelicList
{
	ExtraDraw
}

func select_name(select: int):
	self.Name = RelicList.values()[select]
