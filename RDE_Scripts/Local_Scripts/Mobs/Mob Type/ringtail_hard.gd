extends Ringtail

@export var attack_min : int = 1
@export var attack_max : int = 6

func _process(delta: float) -> void:
	controller.action_handling(6) #randi_range(attack_min, attack_max))
	pass
