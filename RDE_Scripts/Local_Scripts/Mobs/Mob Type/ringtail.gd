class_name Ringtail
extends Node2D

@export var mob_res : MobRes

@export var base : BaseMob 
@export var controller : MobController
@export var spawner : MobSpawner

@export var reducaed_transition_dmg_rate = 0.5

var _bullet_res : BulletRes = preload("uid://bxff3trsofkhp")
var _hollow_bullet_res = preload("res://RDE_Resources/Bullet Res/RGT_Hollow_Projectile.tres")
var _target_bullet_res = preload("res://RDE_Resources/Bullet Res/RGT_Target_Projectile.tres")
var _bullet_load = preload("uid://cy77mdk6wv3fp")

var mob_load = preload("uid://dynvq35tw44w5") # tutorial boss

var explosion_load = preload("res://RDE_Scenes/Entities/Mobs/explosion.tscn")
var minitail_default = preload("res://RDE_Scenes/Entities/Mobs/minitail_default.tscn")
var minitail_speed = preload("res://RDE_Scenes/Entities/Mobs/minitail_speed.tscn")
var minitail_heavy = preload("res://RDE_Scenes/Entities/Mobs/minitail_heavy.tscn")
var minitail_shield = preload("res://RDE_Scenes/Entities/Mobs/minitail_shield.tscn")
var eoths = preload("res://RDE_Scenes/Entities/Mobs/EOTHS.tscn")

var projectile : ShootAttack
var hollow_projectile : ShootAttack
var target_projectile : ShootAttack

var total_delta : float = 0.0

var phase : int = 1
 
func _ready() -> void:
	print("global pos: ", global_position, "	pos: ", position)
	base.set_default_params({"move_torward_player": {"offset": 1, "delay": 0, "speed": 50, "smooth": 100, "length": 1}})
	projectile = ShootAttack.new(base, _bullet_load, _bullet_res, get_parent().get_parent())
	hollow_projectile = ShootAttack.new(base, _bullet_load, _hollow_bullet_res, get_parent().get_parent())
	target_projectile = ShootAttack.new(base, _bullet_load, _target_bullet_res, get_parent().get_parent())


func phase_handler(num_of_phases : int) -> void:
	## Handles changing phases based on hp
	#print("PHASE: ", phase, " hp: ", mob_res.health_comp.cur_hp)
	var new_phase = 1 + floor(
		(mob_res.health_comp.max_hp - mob_res.health_comp.cur_hp) 
		/ (mob_res.health_comp.max_hp / num_of_phases)
		)
	
	if phase != new_phase:
		spawner.spawn_mob(eoths, base.get_rand_player_pos(0,0,0,0), true)
		phase = new_phase

func action0() -> void:
	## Initial action
	base.action("observe_player", 0.5)
	await GlobalTime.local_wait(0.5)
	base.action("move_torward_point", {"target": base.get_rand_player_pos(200, 600, 200, 600), "delay": 0, "speed": 350, "length": 0.5})
	await GlobalTime.local_wait(0.5)
	
	controller.hold(false)
	
func action1() -> void:
	## Follow player
	for i in range(1 + phase):
		base.action("move_torward_player", {"offset": 1, "speed": randi_range(100, 200) * (phase / 1.5), "length": 1})
		await GlobalTime.local_wait(1)
	
	controller.hold(false)
	
func action2() -> void:
	## Dash to player
	for i in randi_range(2, 6): 
		base.action("move_torward_point", {"target": base.player_global_pos, "delay": 0, "speed": 250, "length": 0.5})
		await GlobalTime.local_wait(0.5)
	
	controller.hold(false)
	
func action3() -> void:
	## Dash to opposite* of player
	for i in range(randi_range(1, 3)): 
		base.action("move_torward_point", {"target": Vector2(base.player_global_pos.x * -0.2, base.player_global_pos.y * -0.2), "delay": 0, "speed": 200, "length": 0.5})
		await GlobalTime.local_wait(0.5)

	controller.hold(false)

func action4() -> void:
	## Dash to random places near player
	for i in randi_range(2, 4): 
		base.action("move_torward_point", {"target": base.get_rand_player_pos(50, 200, 50, 200), "delay": 0, "speed": 350, "length": 0.5})
		await GlobalTime.local_wait(0.5)

	controller.hold(false)

func action5() -> void:
	## Follow player, if near player, teleport elsewhere
	mob_res.sprtflip_enabled = false
	for i in range(5):
		base.action("move_torward_player", {"offset": 1, "speed": 600, "length": 0.4})
		await GlobalTime.local_wait(0.4)
		
		if base.distance_to_player < 1000:
			mob_res.sprtflip_enabled = true
			base.action("move_torward_point", {"target": base.get_rand_player_pos(600, 1200, 600, 1200), "delay": 0, "speed": 750, "length": 0.3})
			await GlobalTime.local_wait(0.3)
			mob_res.sprtflip_enabled = false
		base.action("move_torward_player", {"offset": 1.5, "speed": randi_range(200, 400), "length": 1})
		await GlobalTime.local_wait(1)
	
	base.health_res.damage_rate = 1
	base.sprite.modulate = Color(1,1,1)
	controller.hold(false)

func action6() -> void:
	## Point and launch towards player
	var observe_time : int
	for i in randi_range(1, 3):
		mob_res.sprtflip_enabled = false
		observe_time = randi_range(1, 2)
		base.action("observe_player", observe_time)
		await GlobalTime.local_wait(observe_time)
		
		base.action("move_torward_player", {"offset": 1.2, "speed": randi_range(400, 500), "length": 3})
		await GlobalTime.local_wait(3)
		
		#mob_res.sprtflip_enabled = true
		base.action("move_torward_point", {"target": base.get_rand_player_pos(100, 250, 100, 250), "delay": 0, "speed": 750, "length": 0.3})
		await GlobalTime.local_wait(0.3)
	
	controller.hold(false)

func action7() -> void:
	## Passive action that's called between every other action
	#base.sprite.modulate = Color(0.8,0.8,0.8)
	base.health_res.damage_rate = 0.7
	if phase == 3 and randi_range(0,3) == 0:
		action5()
		return
	
	mob_res.sprtflip_enabled = false
	for i in randi_range(1,2):
		for j in range(1 + phase):
			base.action("move_torward_player", {"speed": randi_range(350, 400), "length": 0.2})
			await GlobalTime.local_wait(0.2)
		base.action("observe_player", 0.2)
		await GlobalTime.local_wait(0.2)
	
	base.health_res.damage_rate = 1
	#base.sprite.modulate = Color(1,1,1)
	controller.hold(false)

func chain_explosion(num_of_explosions : int = 5, time_gap : float = 1.0) -> void:
	for i in range(num_of_explosions):
		spawner.spawn_mob(explosion_load, base.player_pos, true)
		await GlobalTime.local_wait(time_gap)
		
