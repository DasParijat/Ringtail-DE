extends Node2D

@export var mob_res : MobRes 
@export var attack_min : int = 1
@export var attack_max : int = 4

@onready var base : CharacterBody2D = $base_mob
@onready var attack_label : Label = $AttackLabel

@onready var bullet_res : BulletRes = preload("res://RDE_Resources/Bullet Res/RGT_Projectile.tres")
var bullet_load = preload("res://RDE_Scenes/Shooting/bullet.tscn")

var cur_action : int
var can_chain_action : bool = false

var cur_magic : int = 1 # used for magic attacks
var can_chain_magic : bool = false

var is_action_running : bool = false

func chain_action(next_attack : int) -> void:
	base.action("action_buffer", 0)
	base.hold(false)
	can_chain_action = true
	cur_action = next_attack
	#print("in chain: ", cur_action, can_chain_action)

func chain_magic(next_magic : int) -> void:
	cur_magic = next_magic
	can_chain_magic = true
	
# TODO Make a smaller version of the ringtail sprite. he's too fat
func _ready() -> void:
	print("boss added")
	global_position = base.global_position
	global_rotation = base.global_rotation
	
	base.set_default_params({"move_torward_player": {"offset": 1, "delay": 0, "speed": 50, "smooth": 100, "length": 1}})
	cur_action = 3
	
func _process(delta: float) -> void:
	action_loop(int(randf_range(attack_min, attack_max)))
	
	#int(randf_range(attack_min, attack_max))

# MAYBE TODO - Put all cur_action handling in own action handling Node
# TODO test using ENUM with cur_action instead of int
func action_loop(next_action : int):
	if base.can_change_action():
		#cur_action += 1 
		attack_label.text = "ATTACK " + str(cur_action)
		match(cur_action):
			1: 
				action1()
			2: 
				action2()
			3: 
				action3()
			_: 
				#print("false attack")
				pass
				
		if not can_chain_action:		
			cur_action = next_action 
		else:
			can_chain_action = false
	
func action1() -> void:
	base.hold(true)
	print("action1")
	base.action("observe_player", 0.4)
	base.action("move_torward_player", {"offset": 1.2, "speed": 150, "length": 2})
	#await GlobalTime.local_wait(1)
	
	#base.action("run_for", 1)
	chain_action(0)

func action2() -> void:
	base.hold(true)
	print("action2")
	for i in range(2): 
		base.action("move_stop_torward_player", {"offset": i * 0.5, "speed": 75, "length": 0.7})
		await GlobalTime.local_wait(1)
		# technically await not needed here 
		# due to it not interacting with out-of-queue actions (like shooting)
	base.action("observe_player", 1.5)
	await GlobalTime.local_wait(1.5)
	chain_action(0)
	
func action3() -> void:
	base.hold(true)
	print("action3")
	base.action("move_torward_player", {"speed": 100, "length": 0.5})
	await GlobalTime.local_wait(0.5)
	
	# creating timer helps RingtailHARD stop complining further code
	# until prev action doen
	
	for i in range(4):
		base.action("move_torward_player", {"speed": 25, "length": 1})
		await GlobalTime.local_wait(1)
		shoot()
	chain_action(0)

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
