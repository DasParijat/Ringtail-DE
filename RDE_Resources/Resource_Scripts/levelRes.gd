extends Resource
class_name LevelRes
# LevelRes is used to define what's in the level

@export var LEVEL_NAME : String = "UNNAMED LEVEL"

@export var tilemap : String 
@export var player_path : String = "res://RDE_Scenes/Entities/oswald.tscn"

# Possibly find way to make this easier to add 
@export var enemies : Array[Dictionary] = [
	{
		"path": StringName("res://RDE_Resources/Mob Res/RingtailHARD.tres"),
		"init_pos": Vector2(0, 100)
	}
]
