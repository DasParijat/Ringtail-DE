extends Node2D

@export var mob_res : MobRes 
@export var attack_min : int = 1
@export var attack_max : int = 4

@onready var base_mob : CharacterBody2D = $base_mob
@onready var attack_label : Label = $AttackLabel

var cur_attack : int = 1
var chain : bool = false

# TODO Make a smaller version of the ringtail sprite. he's too fat
func _ready() -> void:
	print("boss added")
	position = base_mob.position
	
func _process(delta: float) -> void:
	if base_mob.no_action():
		#cur_attack += 1 
		match(cur_attack):
			1: 
				print("attack1")
				attack1()
			2: 
				print("attack2")
				attack2()
			3: 
				print("attack3")
				attack3()
			_: 
				#print("false attack")
				pass
				
		if not chain:		
			cur_attack = 0 #randf_range(attack_min, attack_max)
			attack_label.text = "ATTACK " + str(cur_attack)
		else:
			chain = false
			attack_label.text = "ATTACK " + str(cur_attack)
		# some reason label text assignment only properly works this way

func chain_attack(next_attack : int) -> void:
	cur_attack = next_attack
	chain = true

# TODO Update attacks to use action the new (Dictionary) way

func attack1() -> void:
	#base_mob.action("observe_player", 2)
	base_mob.action("move_stop_torward_player", {"speed": 200})
	chain_attack(2)

func attack2() -> void:
	for i in range(1): # testing using for loops 
		base_mob.action("move_stop_torward_player", {"offset": i + 1})	
	base_mob.action("action_duration", 1)
	base_mob.action("move_torward_point", {"target": Vector2(0, 500), "speed": 100, "length": 0.5})
	chain_attack(3)
	
func attack3() -> void:
	base_mob.action("move_torward_point", {"target": Vector2(0, 100), "speed": 25})
	for i in range(2):
		base_mob.action("observe_player", 0.5)
		base_mob.action("move_torward_player", {})
