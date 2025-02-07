extends Resource
class_name LevelRes
# LevelRes is used to define what's in the level

@export var LEVEL_NAME : String = "UNNAMED LEVEL"

@export var order : Array[Resource] = []

var index = 0
func next_sequence() -> void:
	if index < order.size():
		index += 1
		
