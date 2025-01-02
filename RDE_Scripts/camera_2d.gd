extends Camera2D

# @onready var player_node : Node2D = level_res.player
# this commented out code is for future (possible) set up of a level resource
@export var target_node : Node2D

func _process(delta: float) -> void:
	set_position(target_node.get_position())
	
	# TODO make camera flexible so it can be used for cutscenes or such
