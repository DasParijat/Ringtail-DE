extends Node2D

@export var mob_res : MobRes 
@export var attack_min : int = 1
@export var attack_max : int = 4

@onready var base : CharacterBody2D = $base_mob
@onready var attack_label : Label = $AttackLabel

@onready var bullet_res : BulletRes = preload("res://RDE_Resources/Bullet Res/RGT_Projectile.tres")
var bullet_load = preload("res://RDE_Scenes/Shooting/bullet.tscn")

var cur_action : int = 1
var chain : bool = false

var cur_attack : int = 1 # used for magic attacks

# Actions and attacks happen independently of each other
# Not required for every boss
var action_thread : Thread
var attack_thread : Thread # to be used later when adding magic attacks

# TODO Make a smaller version of the ringtail sprite. he's too fat
func _ready() -> void:
	print("boss added")
	global_position = base.global_position
	
	base.set_default_params({"move_torward_player": {"offset": 1, "delay": 0, "speed": 50, "smooth": 10, "length": 1}})
	
func _process(delta: float) -> void:
	action_thread = Thread.new()
	
	
	action_thread.start(action_loop.bind(int(randf_range(1, 1))))
	
	#action_loop(int(randf_range(attack_min, attack_max)))
	
func action_loop(next_attack : int):
	if base.no_action():
		#cur_action += 1 
		match(cur_action):
			1: 
				print("action1")
				action1()
			2: 
				print("action2")
				action2()
			3: 
				print("action3")
				action3()
			_: 
				#print("false attack")
				pass
				
		if not chain:		
			cur_action = next_attack 
			attack_label.text = "ATTACK " + str(cur_action)
		else:
			chain = false
			attack_label.text = "ATTACK " + str(cur_action)
		# some reason label text assignment only properly works this way
	
		
func chain_attack(next_attack : int) -> void:
	cur_action = next_attack
	chain = true

func action1() -> void:
	#base.action("observe_player", 2)
	base.action("move_torward_point", {"target": base.player_pos, "speed": 50, "length": 0.01})
	#chain_attack(2)

func action2() -> void:
	for i in range(1): # testing using for loops 
		base.action("move_stop_torward_player", {"offset": i + 1})	
	base.action("action_duration", 1)
	base.action("move_torward_point", {"target": Vector2(0, 500), "speed": 100, "length": 0.5})
	#chain_attack(3)
	
func action3() -> void:
	#base.action("move_torward_point", {"target": Vector2(0, 100), "speed": 25})
	base.action("move_torward_player", {"speed": 100})
	#for i in range(2):
	#	base.action("observe_player", 0.5)
	#	base.action("move_torward_player", {})
	#	base.action("observe_player", 0.1)
	#base.action("action_duration", 1)
	shoot()

func shoot() -> void:
	base.action("action_duration", 0.01) # needed to stop program from moving on to next attack pre-shoot
	var bullet = bullet_load.instantiate()
	bullet.bullet_res = bullet_res
	
	# bullet transformations			
	bullet.global_transform = base.global_transform
	bullet.global_position = base.global_position

	# putting bullet in scene
	get_parent().get_parent().add_child(bullet)
			
func _exit_tree() -> void:
	action_thread.wait_to_finish()
