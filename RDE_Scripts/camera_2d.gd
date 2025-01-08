extends Camera2D

# @onready var player_node : Node2D = level_res.player
# this commented out code is for future (possible) set up of a level resource
@onready var fight_node : Node2D = get_parent().get_node("Fight")
# fight node handles getting info from dynamically spawned entities (such as player)

# TODO Add new attributes to GunRes to describe how the camera should shake when shot

var track_player : bool = false
var cur_gun : GunRes 

var scale_lean : float = 0.2
var rng = RandomNumberGenerator.new()

# Shake strength and fade are given from cur_gun
var shake_strength = 100.0 
var shake_fade : float = 5.0

# These shake variables are used for other calculations
var shake_offset : Vector2 # don't change
var shake_range : float = 0.0 

var smooth_offset : float = 10.0 # For affecting offset of Camera2D

func _ready() -> void:
	# to be given by level_res later
	$".".limit_left = -5000
	$".".limit_right = 5000
	$".".limit_top = -1000
	$".".limit_bottom = 1000
	
	GlobalSignal.connect("cur_gun", Callable(self, "_on_cur_gun"))
	
	if fight_node == null:
		printerr("FIGHT NODE UNASSIGNED")
	#$".".position_smoothing_speed = 5
	 
func _process(delta : float) -> void:
	if track_player:
		set_position(fight_node.player_pos)
		offset = lerp(offset, (lean_cam() + shake_offset), delta * smooth_offset)
		
		gun_aim(0.6)
		gun_shake(delta)
		
	# TODO make camera flexible so it can be used for cutscenes or such

func lean_cam() -> Vector2:
	# Credit to samsface on YT (https://youtu.be/GXBEt_QqPMs?si=-chTplQUIvqoX3Xg) 
	var mouse_pos := get_global_mouse_position()
	
	var dir_to_mouse := (mouse_pos - global_position).normalized() # direction
	var dist_to_mouse := global_position.distance_to(mouse_pos) # distance
	
	return dir_to_mouse * dist_to_mouse * scale_lean # lean calculation

func gun_aim(aim_lean) -> void:
	if Input.is_action_pressed("aim"):
		scale_lean = aim_lean
	else:
		scale_lean = 0.2

func gun_shake(delta : float) -> void:
	if Input.is_action_pressed("shoot"):
		shake_range = shake_strength 
		
	if shake_range > 0:
		shake_range = lerpf(shake_range, 0, shake_fade * delta)
		shake_offset = get_randshake_offset()

func get_randshake_offset() -> Vector2:
	return Vector2(rng.randf_range(-shake_range, shake_range), # x axis rand shake
	rng.randf_range(-shake_range, shake_range)) # y axis rand shake

func _on_cur_gun(gun_res):
	cur_gun = gun_res
	shake_strength = cur_gun.shake_strength
	shake_fade = cur_gun.shake_fade


func _on_fight_player_created() -> void:
	track_player = true
