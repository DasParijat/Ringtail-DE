extends Node2D

@export var mob_res : MobRes 
@onready var base_mob : CharacterBody2D = $base_mob

# TODO Make a smaller version of the ringtail sprite. he's too fat
func _ready() -> void:
	print("boss added")
	position = base_mob.position
	
	# testing using base_mob actions from the mob itself
	base_mob.action("observe_player", 1.5)
	for i in range(3): # testing using for loops 
		base_mob.action("move_stop_torward_player", [i + 1, 1, 0, 50, 10, 2])

func _process(delta: float) -> void:
	pass
