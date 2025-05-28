extends Node2D
# Minitail SPEED
@export var mob_res : MobRes

@export var base : BaseMob 
@export var controller : MobController

func _ready() -> void:
	controller.action_handling(2)
	
func _process(delta : float) -> void:
	for i in range(3):
		controller.action_handling(1)
	controller.action_handling(3)


func action1() -> void:
	## Dash near to player
	for i in range(5): 
		base.action("move_torward_point", {"target": base.get_rand_player_pos(25, 75, 25, 75), "delay": 0, "speed": 350, "length": 0.3})
		await GlobalTime.local_wait(0.3)
	
	controller.hold(false)
	
func action2() -> void:
	## Dash to random places near player
	for i in range(5): 
		base.action("move_torward_point", {"target": base.get_rand_player_pos(100, 600, 100, 600), "delay": 0, "speed": 300, "length": 0.2})
		await GlobalTime.local_wait(0.2)
	
	controller.hold(false)

func action3() -> void:
	## Go far from player then dash to them
	base.action("move_torward_point", {"target": base.get_rand_player_pos(600, 700, 600, 700), "delay": 0, "speed": 300, "length": 0.5})
	await GlobalTime.local_wait(0.5)
	base.action("move_torward_point", {"target": base.get_rand_player_pos(25, 75, 25, 75), "delay": 0, "speed": 250, "length": 0.3})
	await GlobalTime.local_wait(0.3)
	
	controller.hold(false)

func _exit_tree() -> void:
	GlobalSignal.emit_signal("update_power", 2)
