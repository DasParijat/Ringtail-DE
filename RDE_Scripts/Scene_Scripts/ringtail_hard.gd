extends Node2D

@export var mob_res : MobRes

@export var attack_min : int = 1
@export var attack_max : int = 4

@onready var controller : Node2D = $MobController
@onready var base : CharacterBody2D = $base_mob

@onready var bullet_res : BulletRes = preload("res://RDE_Resources/Bullet Res/RGT_Projectile.tres")
var bullet_load = preload("res://RDE_Scenes/Shooting/bullet.tscn")

func _ready() -> void:
	base.set_default_params({"move_torward_player": {"offset": 1, "delay": 0, "speed": 50, "smooth": 100, "length": 1}})
	controller.cur_action = 1

func _process(delta: float) -> void:
	controller.action_handling(int(randf_range(attack_min, attack_max)))
	
	#int(randf_range(attack_min, attack_max))

func action1() -> void:
	#controller.hold(true)
	print("action1")
	#base.action("orbit_player", {"speed": 10, "length": 2})
	base.action("action_rotate", {"rotate": 180, "length": 3})
	base.action("move_torward_player", {"offset": 1, "speed": 150, "length": 2})
	#base.action("move_torward_point", {"speed": 10, "length": 3})
	#base.action("teleport", Vector2(0, 0))
	#await GlobalTime.local_wait(1)
	
	#base.action("run_for", 1)
	controller.chain_action(1)

func action2() -> void:
	#base.hold(true)
	print("action2")
	for i in range(2): 
		base.action("move_torward_player", {"offset": i * 0.5, "speed": 75, "length": 0.7})
		await GlobalTime.local_wait(1)
		# technically await not needed here 
		# due to it not interacting with out-of-queue actions (like shooting)
	base.action("observe_player", 1.5)
	await GlobalTime.local_wait(1.5)
	controller.chain_action(0)
	
func action3() -> void:
	#base.hold(true)
	print("action3")
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

	# putting bullet in scene
	get_parent().get_parent().add_child(bullet)
