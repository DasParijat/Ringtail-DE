extends Camera2D

# @onready var player_node : Node2D = level_res.player
# this commented out code is for future (possible) set up of a level resource
@onready var fight_node : Node2D = get_parent().get_node("Fight")
# fight node handles getting info from dynamically spawned entities (such as player)

var track_player : bool = true

var smooth_lean : float = 10.0
var scale_lean : float = 0.2

func _ready() -> void:
	# to be given by level_res later
	$".".limit_left = -5000
	$".".limit_right = 5000
	$".".limit_top = -1000
	$".".limit_bottom = 1000
	
	if fight_node == null:
		printerr("FIGHT NODE UNASSIGNED")
	#$".".position_smoothing_speed = 5
	 
func _process(delta : float) -> void:
	if track_player:
		lean_cam(delta)
		set_position(fight_node.player_pos)
	
	# TODO make camera have aim and camera shake
	# TODO make camera flexible so it can be used for cutscenes or such

func lean_cam(delta : float) -> void:
	# Credit to samsface on YT (https://youtu.be/GXBEt_QqPMs?si=-chTplQUIvqoX3Xg) 
	var mouse_pos := get_global_mouse_position()
	
	var dir_to_mouse := (mouse_pos - global_position).normalized() # direction
	var dist_to_mouse := global_position.distance_to(mouse_pos) # distance
	
	var lean := dir_to_mouse * dist_to_mouse * scale_lean # lean calculation
	#print(lean)
	offset = lerp(offset, lean, delta * smooth_lean) # smooths lean
