extends Node2D
# Embodiment Of The Human Spirit
@export var mob_res : MobRes

@export var base : BaseMob 
@export var controller : MobController

var power_give : float = 0
var hp_give : float = 0

var can_execute : bool = true

func _ready() -> void:
	#print("EOTHS SPAWNED!!")
	GlobalSignal.connect("get_cur_stats", Callable(self, "_on_get_cur_stats"))
	
func _on_get_cur_stats(type : String, stats) -> void:
	## Keeps trying to get player stats until they exist
	## Then stops trying to receive player stats to prevent overlap
	if type == "PLAYER" and can_execute:
		if stats["cur_hp"] != null:
			hp_give = stats["cur_hp"] / 3
		if stats["cur_power"] != null:
			power_give = stats["cur_power"] / 3
		
		can_execute = false
	
		action1()
	
func action1() -> void:
	#print("EOTHS SPAWNED!!")
	GlobalSignal.emit_signal("update_power", power_give)
	GlobalSignal.emit_signal("update_player_hp", hp_give)
	base.health_res.kill_self()
