extends Node2D
# Minitail DEFAULT

@export var mob_res : MobRes
@export var base : BaseMob 
@export var controller : MobController

var total_delta : float = 0.0

func _ready() -> void:
	controller.action_handling(1)
	
func _process(delta : float) -> void:
	total_delta += delta
	
	if randi_range(0,7) == 0 or total_delta < 5.0:
		controller.action_handling(1)
	else:
		controller.action_handling(2)
	
func action1() -> void:
	## Dash near to player
	for i in range(3): 
		base.action("move_torward_point", {"target": base.get_rand_player_pos(25, 75, 25, 75), "delay": 0, "speed": 200, "length": 0.5})
		await GlobalTime.local_wait(0.5)
	
	controller.hold(false)

func action2() -> void:
	## Dash near to random places
	for i in range(3): 
		base.action("move_torward_point", {"target": base.get_rand_player_pos(250, 450, 250, 450), "speed": 180, "length": 0.4})
		await GlobalTime.local_wait(0.4)
	
	controller.hold(false)
	
func _exit_tree() -> void:
	GlobalSignal.emit_signal("update_power", 0.3)
