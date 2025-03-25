extends Camera2D

# @onready var player_node : Node2D = level_res.player
# this commented out code is for future (possible) set up of a level resource
@onready var fight_node : Node2D = get_parent().get_node("Fight")
# fight node handles getting info from dynamically spawned entities (such as player)

var track_player : bool = false
@export var player_tracking_speed : float = 1.0
var cur_gun : GunRes 

var scale_lean : float = 0.2
@export var max_lean_distance : float = 200
var rng = RandomNumberGenerator.new()

# Shake strength and fade are given from cur_gun
var shake_strength = 100.0 
var shake_fade : float = 5.0

# These shake variables are used for other calculations
var shake_offset : Vector2 # don't change
var shake_range : float = 0.0 

var smooth_offset : float = 10.0 # For affecting offset of Camera2D

var is_reloading : bool = false

func _ready() -> void:
	GlobalSignal.connect("cur_gun", Callable(self, "_on_cur_gun"))
	GlobalSignal.connect("get_cur_stats", Callable(self, "_on_get_cur_stats"))
	
	if GlobalScene.cam_border_x and GlobalScene.cam_border_y:
		$".".limit_left = -GlobalScene.cam_border_x
		$".".limit_right = GlobalScene.cam_border_x
		$".".limit_top = -GlobalScene.cam_border_y
		$".".limit_bottom = GlobalScene.cam_border_y
		
	if fight_node == null:
		printerr("FIGHT NODE UNASSIGNED")
	#$".".position_smoothing_speed = 5
	 
func _process(delta : float) -> void:
	if track_player:
		set_position(fight_node.player_pos * player_tracking_speed)
		offset = lerp(offset, (lean_cam() + shake_offset), delta * smooth_offset)
		
		gun_aim(0.6)
		player_power_handling(1.2, 10)

	gun_shake(delta)
	
	# TODO make camera flexible so it can be used for cutscenes or such
	# TODO have camera stop tracking player when player node is removed/dead

func player_power_handling(zoom_amt : float, zoom_rate : float) -> void:
	var target_zoom: Vector2
	if GlobalPlayer.power_activated:
		target_zoom = Vector2.ONE * zoom_amt
	else:
		target_zoom = Vector2.ONE

	zoom = zoom.lerp(target_zoom, get_process_delta_time() * zoom_rate)
		
func lean_cam() -> Vector2:
	# Credit to samsface on YT (https://youtu.be/GXBEt_QqPMs?si=-chTplQUIvqoX3Xg) 
	var mouse_pos := get_global_mouse_position()
	
	var dir_to_mouse := (mouse_pos - global_position).normalized() # direction
	var dist_to_mouse := global_position.distance_to(mouse_pos) # distance
	
	return dir_to_mouse * clampf(dist_to_mouse * scale_lean, -max_lean_distance, max_lean_distance) # lean calculation

func gun_aim(aim_lean) -> void:
	if Input.is_action_pressed("aim"):
		scale_lean = aim_lean
	else:
		scale_lean = 0.2

func gun_shake(delta : float) -> void:
	if Input.is_action_pressed("shoot") and not is_reloading and not GlobalTime.is_paused:
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

func _on_get_cur_stats(type, stats) -> void:
	# So the camera doesn't shake when player tries shooting during reload
	if type == "GUN":
		is_reloading = stats["is_reloading"]
		
func _on_fight_player_created() -> void:
	track_player = true
