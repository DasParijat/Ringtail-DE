class_name Ringtail
extends Node2D

@export var mob_res : MobRes

@export var controller : MobController
@export var base : BaseMob 
@export var spawner : MobSpawner

var bullet_res : BulletRes = preload("uid://bxff3trsofkhp")
var bullet_load = preload("uid://cy77mdk6wv3fp")
var mob_load = preload("uid://cja72mr27m4j3")

func _ready() -> void:
	base.set_default_params({"move_torward_player": {"offset": 1, "delay": 0, "speed": 50, "smooth": 100, "length": 1}})
	controller.cur_action = 1

# ATTACK PLAN
# PHYSICAL
# Follow player
# Dash to last player position (0.2s~ distance)
# Dash to opposite of last player position
# Dash to random places 
# Follow and teleport when hits player
# Point and launch towards player (then teleport somewhere else)

# MAGIC
# Random triangle bullets (like with obignale and darius)
# Explosion thing
# Tracking triangles (will follow player for a bit before just going straight)
# Chain explosion thing
# Laser triangles (series of triangles towards player)
# Targeting triangles (triangles circle around player)

func action1() -> void:
	mob_res.sprtflip_enabled = false
	for i in randi_range(1, 2):
		base.action("move_torward_player", {"offset": 1.2, "speed": randi_range(100, 300), "length": 1})
		await GlobalTime.local_wait(1)
	#spawner.spawn_mob(mob_load, Vector2(0, 100))
	controller.chain_action(3)

func action2() -> void:
	#base.hold(true)
	#print("action2")
	for i in range(4): 
		base.action("move_torward_point", {"target": base.player_pos, "speed": 150, "smooth": 50, "length": 1})
		await GlobalTime.local_wait(1)
		# due to it not interacting with out-of-queue actions (like shooting)
	base.action("observe_player", 1.5)
	await GlobalTime.local_wait(1.5)
	controller.chain_action(3)
	
func action3() -> void:
	#base.hold(true)
	base.action("move_torward_player", {"speed": 100, "length": 0.5})
	await GlobalTime.local_wait(0.5)
	
	# creating timer helps RingtailHARD stop complining further code
	# until prev action doen
	
	for i in range(4):
		base.action("move_torward_player", {"speed": 25, "length": 1})
		await GlobalTime.local_wait(1)
		shoot()
	controller.chain_action(1)

func shoot() -> void:
	#base.action("run_until", true) # needed to stop program from moving on to next attack pre-shoot
	var bullet = bullet_load.instantiate()
	bullet.bullet_res = bullet_res
	
	# bullet transformations			
	bullet.global_transform = base.global_transform
	bullet.global_position = base.global_position
	bullet.bullet_speed = 1000
	bullet.target_group = "Player"
	
	# putting bullet in scene
	get_parent().get_parent().add_child(bullet)
