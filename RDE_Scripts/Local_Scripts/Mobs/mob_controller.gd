class_name MobController
extends Node2D

@onready var attack_node : Node2D = get_parent()

@export var base : BaseMob 
@export var attack_label : Label # Not required
#@onready var mob_name : String = mob_res.name # used to check what mob it is

var cur_action : int
var can_chain_action : bool = false

var cur_magic : int = 1 # used for magic attacks
var can_chain_magic : bool = false

var no_hold : bool = true

func chain_action(next_attack : int) -> void:
	base.action("action_buffer", 0)
	hold(false)
	can_chain_action = true
	cur_action = next_attack
	#print("in chain: ", cur_action, can_chain_action)

func chain_magic(next_magic : int) -> void:
	cur_magic = next_magic
	can_chain_magic = true

func hold(start_hold : bool) -> void:
	if start_hold:
		no_hold = false
	else:
		no_hold = true
		
func _ready() -> void:
	print("boss added")
	global_position = base.global_position
	global_rotation = base.global_rotation

func action_handling(next_action : int):
	if base.can_change_action() and no_hold:
		#cur_action += 1 
		if attack_label:
			attack_label.text = "ATTACK " + str(cur_action)
		
		base.mob_res.sprtflip_enabled = base.mob_res.base_sprtflip_enabled
		var action_name = "action" + str(cur_action)
		if attack_node.has_method(action_name):
			hold(true)
			attack_node.call(action_name)
		else:
			#print("false attack")
			hold(false)
				
		if not can_chain_action:
			cur_action = next_action 
		else:
			can_chain_action = false
