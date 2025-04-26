class_name Ringtail
extends Node2D

@export var mob_res : MobRes

@export var controller : MobController
@export var base : BaseMob 
@export var spawner : MobSpawner

var bullet_res : BulletRes = preload("uid://bxff3trsofkhp")
var bullet_load = preload("uid://cy77mdk6wv3fp")
var mob_load = preload("uid://dynvq35tw44w5")

var shoot_attack : ShootAttack

var total_delta : float = 0.0

func _ready() -> void:
	base.set_default_params({"move_torward_player": {"offset": 1, "delay": 0, "speed": 50, "smooth": 100, "length": 1}})
	shoot_attack = ShootAttack.new(base, bullet_load, bullet_res, get_parent().get_parent())

# ATTACK PLAN
# PHYSICAL
# Follow player DONE
# Dash to last player position (0.2s~ distance) DONE
# Dash to opposite of last player position DONE
# Dash to random places DONE
# Follow and teleport when hits player DONE
# Point and launch towards player (then teleport somewhere else) DONE

# MAGIC
# Random triangle bullets (like with obignale and darius) DONE
# Explosion thing
# Tracking triangles (will follow player for a bit before just going straight) DONE
# Chain explosion thing
# Laser triangles (series of triangles towards player) DONE

func action1() -> void:
	## Follow player
	mob_res.sprtflip_enabled = false
	for i in randi_range(1, 2):
		base.action("move_torward_player", {"offset": 1.2, "speed": randi_range(100, 300), "length": 1})
		await GlobalTime.local_wait(1)
	#spawner.spawn_mob(mob_load, Vector2(0, 100))
	#controller.chain_action(3)
	controller.hold(false)
	
func action2() -> void:
	## Dash to player
	for i in range(randi_range(2, 6)): 
		base.action("move_torward_point", {"target": base.player_pos, "delay": 0, "speed": 200, "length": 0.5})
		await GlobalTime.local_wait(0.5)
	
	#spawner.spawn_mob(mob_load, global_position)
	#controller.chain_action(3)
	controller.hold(false)
	
func action3() -> void:
	## Dash to opposite* of player
	for i in range(randi_range(1, 3)): 
		base.action("move_torward_point", {"target": Vector2(base.player_pos.x * -0.2, base.player_pos.y * -0.2), "delay": 0, "speed": 200, "length": 0.5})
		await GlobalTime.local_wait(0.5)

	controller.hold(false)

func action4() -> void:
	## Dash to random places near player
	for i in range(randi_range(1, 3)): 
		base.action("move_torward_point", {"target": base.get_rand_player_pos(100, 600, 100, 600), "delay": 0, "speed": 200, "length": 0.5})
		await GlobalTime.local_wait(0.5)

	controller.hold(false)

func action5() -> void:
	## Follow player, if near player, teleport elsewhere
	mob_res.sprtflip_enabled = false
	for i in randi_range(3, 6):
		base.action("move_torward_player", {"offset": 1, "speed": 600, "length": 0.4})
		await GlobalTime.local_wait(0.4)
		
		if base.distance_to_player < 2000:
			mob_res.sprtflip_enabled = true
			base.action("move_torward_point", {"target": base.get_rand_player_pos(600, 1200, 600, 1200), "delay": 0, "speed": 750, "length": 0.3})
			await GlobalTime.local_wait(0.3)
			mob_res.sprtflip_enabled = false
		base.action("move_torward_player", {"offset": 1.5, "speed": randi_range(100, 200), "length": 1})
		await GlobalTime.local_wait(1)
		
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
	
