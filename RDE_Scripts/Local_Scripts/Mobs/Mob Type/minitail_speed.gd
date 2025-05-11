extends Node2D
# Minitail SPEED

@export var attack_min : int = 1
@export var attack_max : int = 2

@export var mob_res : MobRes

@export var base : BaseMob 
@export var controller : MobController

func _ready() -> void:
	controller.action_handling(randi_range(attack_min, attack_max))
	
func _process(delta : float) -> void:
	controller.action_handling(randi_range(attack_min, attack_max))


func action1() -> void:
	## Dash near to player
	for i in range(5): 
		base.action("move_torward_point", {"target": base.get_rand_player_pos(25, 75, 25, 75), "delay": 0, "speed": 700, "length": 0.3})
		await GlobalTime.local_wait(0.3)
	
	controller.hold(false)
	
func action2() -> void:
	## Dash to random places near player
	for i in range(10): 
		base.action("move_torward_point", {"target": base.get_rand_player_pos(100, 600, 100, 600), "delay": 0, "speed": 700, "length": 0.3})
		await GlobalTime.local_wait(0.3)

	controller.hold(false)

func _exit_tree() -> void:
	return
	
	var tween : Tween = create_tween()
	tween.set_parallel(true)

	tween.tween_property(self, "modulate", Color(1, 1, 1, 0), 0.5)
	tween.tween_property(self, "scale", Vector2(3, 3), 0.5)

	await tween.finished
