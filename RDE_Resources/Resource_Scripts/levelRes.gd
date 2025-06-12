extends Resource
class_name LevelRes
# LevelRes is used to define what's in the level

@export var LEVEL_NAME : String = "UNNAMED LEVEL"
@export var DISPLAY_NAME : String = "Unamed Level"
@export var LEVEL_DESC : String = "This is a description for a level, displayed in story menu"
@export var THUMBNAIL : Texture

@export var order : Array[Resource] = []

var index = 0
var sequence_end : bool = false

func next_sequence() -> void:
	var continue_sequence = index < order.size() - 1
	
	if continue_sequence:
		index += 1
	sequence_end = not continue_sequence
		
	
		
