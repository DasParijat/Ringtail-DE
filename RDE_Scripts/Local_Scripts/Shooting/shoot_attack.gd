class_name ShootAttack
extends Node

var base : CharacterBody2D
var bullet_load : PackedScene
var bullet_res : BulletRes
var game_scene : Node

func _init(given_base : BaseMob, given_bullet_load : PackedScene, given_bullet_res : BulletRes, given_game_scene : Node) -> void:
	base = given_base
	bullet_load = given_bullet_load
	bullet_res = given_bullet_res
	game_scene = given_game_scene

func shoot(position : Vector2 = base.global_position, speed : float = 500, follow_target : bool = false, target_group : String = "Player") -> void:
	#base.action("run_until", true) # needed to stop program from moving on to next attack pre-shoot
	var bullet = bullet_load.instantiate()
	bullet.bullet_res = bullet_res
	
	if not base:
		# For when mob deletes itself & base no longer exists
		return
		
	bullet.global_transform = base.global_transform

	bullet.global_position = position
	bullet.bullet_speed = speed
	bullet.target_group = target_group
	
	bullet.follow_target = follow_target
	
	# putting bullet into game scene
	game_scene.add_child(bullet)
	
func shoot_from_rand(speed : float = 500, from_x : float = 500, to_x : float = 1000, from_y : float = 500, to_y : float = 1000) -> void:
	shoot(base.get_rand_player_pos(from_x, to_x, from_y, to_y), 
			speed)

func shoot_laser(num_of_bullets : int, time_difference : float = 0.2, speed : float = 500) -> void:
	# Variables so each bullet has the same start pos and target
	var start_pos : Vector2 = base.get_rand_player_pos(500, 1000, 500, 1000)
	
	for i in range(num_of_bullets):
		shoot(start_pos, speed)
		await GlobalTime.local_wait(time_difference)
