extends Node2D
# Minitail SHIELD

@export var mob_res : MobRes
@export var base : BaseMob 
@export var controller : MobController

var main_boss_pos : Vector2

func _ready() -> void:
	controller.action_handling(1)
	GlobalSignal.connect("get_cur_stats", Callable(self, "_on_get_cur_stats"))
	
func _process(delta : float) -> void:
	controller.action_handling(1)


func action1() -> void:
	## Go to player if nearby, else hover around boss
	if base.distance_to_player > 100:
		# TODO add a new action "orbit_main_boss" to base mob
		base.action("move_torward_point", {"target": main_boss_pos, "delay": 0, "speed": 100, "length": 0.3})
	else:
		base.action("move_torward_point", {"target": base.get_rand_player_pos(0, 20, 0, 20), "delay": 0, "speed": 500, "length": 0.3})
	
	await GlobalTime.local_wait(0.3)
	
	controller.hold(false)

func _on_get_cur_stats(type, stats) -> void:
	if type == "MAIN_BOSS":
		main_boss_pos = stats["position"]
	
func _exit_tree() -> void:
	# Player receives a free 3 cur_power when minitail dies
	GlobalSignal.emit_signal("update_power", 4)
