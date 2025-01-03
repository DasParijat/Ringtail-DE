extends Camera2D

# @onready var player_node : Node2D = level_res.player
# this commented out code is for future (possible) set up of a level resource
@export var player_node : Node2D
var target_node : Node2D = player_node

var track_player : bool = true

func _ready() -> void:
	# to be given by level_res later
	$".".limit_left = -5000
	$".".limit_right = 5000
	$".".limit_top = -1000
	$".".limit_bottom = 1000
	
	if player_node == null:
		printerr("PLAYER NODE UNASSIGNED")
	#$".".position_smoothing_speed = 5
	 
func _process(delta: float) -> void:
	if track_player:
		set_position(player_node.get_position())
	
	# TODO make camera flexible so it can be used for cutscenes or such
