extends Node2D
# Minitail SHIELD

@export var mob_res : MobRes
@export var base : BaseMob 
@export var controller : MobController

var total_time : float = 0.0

func _ready() -> void:
	controller.action_handling(1)
	GlobalSignal.connect("get_cur_stats", Callable(self, "_on_get_cur_stats"))
	
func _process(delta : float) -> void:
	total_time += delta
	
	if total_time < 20.0:
		controller.action_handling(1)
	else:
		base.health_res.kill_self()


func action1() -> void:
	## Go to player if nearby, else hover around boss
	if base.distance_to_player > 300:
		base.action("move_torward_mainB", {"offset": randf_range(0.7, 1.3), "speed": 200, "length": 0.15})
		await GlobalTime.local_wait(0.15)
	else:
		base.action("move_torward_point", {"target": base.get_rand_player_pos(0, 20, 0, 20), "speed": 500, "length": 0.3})
		await GlobalTime.local_wait(0.3)
		base.action("move_torward_mainB", {"speed": 400, "length": 0.2})
		await GlobalTime.local_wait(0.2)
	
	controller.hold(false)

func _exit_tree() -> void:
	GlobalSignal.emit_signal("update_power", 5)
