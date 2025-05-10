extends Node2D
# Minitail SPEED

@export var attack_min : int = 1
@export var attack_max : int = 6

@export var mob_res : MobRes

@export var base : BaseMob 
@export var controller : MobController

var total_delta : float = 0

func _process(delta : float) -> void:
	#controller.action_handling(randi_range(attack_min, attack_max))
	total_delta += delta
	# TODO make this work
	player_dash()

func player_dash() -> void:
	## Dash to player
	for i in range(randi_range(2, 6)): 
		base.action("move_torward_point", {"target": base.player_global_pos, "delay": 0, "speed": 200, "length": 0.5})
		await GlobalTime.local_wait(0.5)

func rand_dash() -> void:
	## Dash to random places near player
	for i in range(randi_range(1, 3)): 
		base.action("move_torward_point", {"target": base.get_rand_player_pos(100, 600, 100, 600), "delay": 0, "speed": 200, "length": 0.5})
		await GlobalTime.local_wait(0.5)

	controller.hold(false)
