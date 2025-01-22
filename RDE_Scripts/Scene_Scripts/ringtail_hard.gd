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

func chain_action(next_attack : int) -> void:
	base.action("action_buffer", 0)
	cur_action = next_attack
	can_chain_action = true
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
	cur_action = 1
	
func _process(delta: float) -> void:
	action_loop(3)
	
	#int(randf_range(attack_min, attack_max))
	
func action_loop(next_action : int):
	if base.no_action() and not GlobalTime.is_paused and base.no_hold:
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
			#base.action("action_buffer", "BUFFER")
			cur_action = next_action 
		else:
			can_chain_action = false
	
func action1() -> void:
	print("action1")
	#base.action("observe_player", 2)
	base.action("move_torward_player", {"offset": 1.2, "length": 2})
	#base.action("run_for", 1)
	chain_action(3)

func action2() -> void:
	print("action2")
	for i in range(3): # testing using for loops 
		base.action("move_stop_torward_player", {"offset": i * 0.5})	
	#base.action("run_for", 1)
	#base.action("move_torward_point", {"target": Vector2(0, 500), "speed": 100, "length": 0.5})
	base.action("run_for", 1.5)
	chain_action(1)
	
func action3() -> void:
	print("action3")
	#base.action("move_torward_point", {"target": Vector2(0, 100), "speed": 25})
	base.action("move_torward_player", {"speed": 100})
	base.hold(true)
	await get_tree().create_timer(1).timeout
	base.hold(false)
	# creating timer helps RingtailHARD stop complining further code
	# until prev action doen
	
	for i in range(1):
		base.action("move_torward_player", {"speed": 25, "length": 0.2})
		base.hold(true)
		await get_tree().create_timer(0.2).timeout
		base.hold(false)
		shoot()
	#base.action("hold", false)
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
