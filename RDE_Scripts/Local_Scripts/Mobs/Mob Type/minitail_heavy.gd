extends Node2D
# Minitail HEAVY

@export var mob_res : MobRes
@export var base : BaseMob 
@export var controller : MobController

func _ready() -> void:
	controller.action_handling(1)
	
func _process(delta : float) -> void:
	controller.action_handling(1)


func action1() -> void:
	## Dash near to player
	base.action("move_torward_point", {"target": base.get_rand_player_pos(25, 75, 25, 75), "delay": 0.3, "speed": 150, "length": 1})
	await GlobalTime.local_wait(1)
		
	for i in range(2): 
		base.action("move_torward_point", {"target": base.get_rand_player_pos(600, 700, 600, 700), "delay": 0, "speed": 150, "length": 1})
		await GlobalTime.local_wait(1)
	
	controller.hold(false)

func _exit_tree() -> void:
	# Player receives a free 3 cur_power when minitail dies
	GlobalSignal.emit_signal("update_power", 5)
