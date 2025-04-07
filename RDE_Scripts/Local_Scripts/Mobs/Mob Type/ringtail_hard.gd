extends Ringtail

@export var attack_min : int = 1
@export var attack_max : int = 3

func _process(delta: float) -> void:
	controller.action_handling(randi_range(attack_min, attack_max))
	
	total_delta += delta

	if total_delta >= 1.0:
		shoot_from_boss()
		total_delta = 0.0
