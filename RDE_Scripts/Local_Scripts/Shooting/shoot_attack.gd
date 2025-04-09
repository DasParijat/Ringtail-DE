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
	"follow_target": false
}
func _init(given_base : BaseMob, given_bullet_load : PackedScene, given_bullet_res : BulletRes, given_game_scene : Node) -> void:
	base = given_base
	bullet_load = given_bullet_load
	bullet_res = given_bullet_res
	game_scene = given_game_scene

func set_bullet_prop(default, given_value):
	## If no given_value, then return default value
	if given_value != null:
		print("given_value", given_value)
		return given_value
	#print("default")
	return default
	
# TODO - Do the same thing I did with params in base mob (whole function to parse through dictionary)
func shoot(bullet_params : Dictionary = {"position": base.global_position}) -> void: 
	# OLD PARAMS: position : Vector2 = base.global_position, speed : float = 500, follow_target : bool = false, target_group : String = "Player") -> void:
	var bullet = bullet_load.instantiate()
	bullet.bullet_res = bullet_res
	
	if not base:
		# For when mob deletes itself & base no longer exists
		return
		
	bullet.global_transform = base.global_transform

	bullet.global_position = set_bullet_prop(base.global_position, bullet_params["position"])
	bullet.bullet_speed = set_bullet_prop(500, bullet_params["speed"])
	bullet.target_group = set_bullet_prop("Player", bullet_params["target_group"])
	bullet.follow_target = set_bullet_prop(false, bullet_params["follow_target"])
	
	# putting bullet into game scene
	game_scene.add_child(bullet)
	
func shoot_from_rand(bullet_params : Dictionary = base_bullet_params, from_x : float = 500, to_x : float = 1000, from_y : float = 500, to_y : float = 1000) -> void:
	#shoot(base.get_rand_player_pos(from_x, to_x, from_y, to_y), 
	#		speed)
	bullet_params["position"] = base.get_rand_player_pos(from_x, to_x, from_y, to_y)
	#print("params position: ", bullet_params["position"])
	shoot(bullet_params)

func shoot_laser(bullet_params : Dictionary =  base_bullet_params, num_of_bullets : int = 10, time_difference : float = 0.2) -> void:
	# Variables so each bullet has the same start pos and target
	var start_pos : Vector2 = base.get_rand_player_pos(500, 1000, 500, 1000)
	
	for i in range(num_of_bullets):
		shoot(bullet_params)
		await GlobalTime.local_wait(time_difference)
