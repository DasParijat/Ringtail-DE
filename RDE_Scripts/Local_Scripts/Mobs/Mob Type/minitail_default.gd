extends Node2D
# Minitail DEFAULT

@export var mob_res : MobRes
@export var base : BaseMob 
@export var controller : MobController

func _ready() -> void:
	controller.action_handling(1)
	
func _process(delta : float) -> void:
	controller.action_handling(1)


func action1() -> void:
	## Dash near to player
	for i in range(5): 
		base.action("move_torward_point", {"target": base.get_rand_player_pos(25, 75, 25, 75), "delay": 0, "speed": 200, "length": 0.5})
		await GlobalTime.local_wait(0.5)
	
	controller.hold(false)

func _exit_tree() -> void:
	GlobalSignal.emit_signal("update_power", 1)
