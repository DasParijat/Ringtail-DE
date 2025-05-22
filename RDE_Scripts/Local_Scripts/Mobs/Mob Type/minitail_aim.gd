extends Node2D
# Minitail AIM

@export var mob_res : MobRes
@export var base : BaseMob 
@export var controller : MobController

func _ready() -> void:
	#controller.action_handling(1)
	mob_res.sprtflip_enabled = false
	base.action("observe_player", 3)
	await GlobalTime.local_wait(3)
	
	base.action("move", {"speed": 1500, "length": 1})
	await GlobalTime.local_wait(1)
	
	base.health_res.kill_self()
	
func _process(delta : float) -> void:
	#controller.action_handling(1)
	pass


func action1() -> void:
	## Observe player, then move forward
	base.action("observe_player", 1)
	await GlobalTime.local_wait(1)
	
	base.action("move", {"speed": 800, "rotate": 0, "length": 1})
	await GlobalTime.local_wait(1)
	
	controller.hold(false)
