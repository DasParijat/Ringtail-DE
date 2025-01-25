extends Node2D
# TODO rework it once again so controller is child node of attacks

@export var mob_res : MobRes
@export var attack_node : Node2D

@onready var base : CharacterBody2D = $base_mob
@onready var attack_label : Label = $AttackLabel
@onready var mob_name : String = mob_res.name # used to check what mob it is
# MAYBE TODO - Rename this script controller, to handle all mobs

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

func action_handling(next_action : int):
	if base.can_change_action():
		#cur_action += 1 
		attack_label.text = "ATTACK " + str(cur_action)
		
		var action_name = "action" + str(cur_action)
		if attack_node.has_method(action_name):
			base.hold(true)
			attack_node.call(action_name)
		else:
			#print("false attack")
			base.hold(false)
				
		if not can_chain_action:
			cur_action = next_action 
		else:
			can_chain_action = false
