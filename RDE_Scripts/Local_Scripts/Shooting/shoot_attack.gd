class_name ShootAttack
extends Node

var base : CharacterBody2D
var bullet_load : PackedScene
var bullet_res : BulletRes
var game_scene : Node

var base_bullet_params : Dictionary = {
	"position": Vector2(0, 10),
	"speed": 500,
	"target_group": "Player",
	"follow_target": false,
	"follow_target_length": 1.0,
	"in_group": "Enemy"
}
func _init(given_base : BaseMob, given_bullet_load : PackedScene, given_bullet_res : BulletRes, given_game_scene : Node) -> void:
	base = given_base
	bullet_load = given_bullet_load
	bullet_res = given_bullet_res
	game_scene = given_game_scene

func get_modified_params(mod : Dictionary) -> Dictionary:
	## Any length of params is taken in, and combined with the rest of the default params.
	# Copied from base mob
	var new_params = base_bullet_params.duplicate()
	for i in mod.keys():
		new_params[i] = mod[i]
	return new_params

func set_default_params(new_def : Dictionary) -> void:
	## For changing the default params of an shoot()
	# Copied from base mob
	for i in new_def.keys():
		base_bullet_params[i] = new_def[i].duplicate()

func _shoot(bullet_params : Dictionary = {"position": base.global_position}) -> void: 
	## Base shoot func, used within shoot_attack only
	if not base:
		return # For when mob deletes itself & base no longer exists
	
	var bullet = bullet_load.instantiate()
	bullet.bullet_res = bullet_res
	
	var params = bullet_params
	if typeof(params) == TYPE_DICTIONARY:
		params = get_modified_params(bullet_params)
	else:
		printerr("BULLET PARAMS NEED TO BE DICTIONARY TYPE")
		return
	
	print(params)
	bullet.global_transform = base.global_transform

	bullet.global_position = params["position"] 
	bullet.bullet_speed = params["speed"] 
	
	bullet.target_group = params["target_group"] 
	bullet.in_group = params["in_group"]
	
	bullet.follow_target = params["follow_target"]
	bullet.follow_target_length = params["follow_target_length"]
	
	# putting bullet into game scene
	game_scene.add_child(bullet)

func shoot(bullet_params : Dictionary = base_bullet_params):
	## Shoot used by mob (shoots from mob itself)
	bullet_params["position"] = base.global_position
	_shoot(bullet_params)
	
func shoot_from_rand(bullet_params : Dictionary = base_bullet_params, from_x : float = 500, to_x : float = 1000, from_y : float = 500, to_y : float = 1000) -> void:
	bullet_params["position"] = base.get_rand_player_pos(from_x, to_x, from_y, to_y)
	_shoot(bullet_params)

func shoot_laser(bullet_params : Dictionary =  base_bullet_params, num_of_bullets : int = 10, time_difference : float = 0.2) -> void:
	# So each bullet has the same start pos and target
	var start_pos : Vector2 = base.get_rand_player_pos(500, 1000, 500, 1000)
	
	for i in range(num_of_bullets):
		_shoot(bullet_params)
		await GlobalTime.local_wait(time_difference)
