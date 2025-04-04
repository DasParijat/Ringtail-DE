extends Ringtail

@export var attack_min : int = 1
@export var attack_max : int = 3

var total_delta : float = 0.0

func _process(delta: float) -> void:
	controller.action_handling(randi_range(attack_min, attack_max))
	
	total_delta += delta
	if total_delta >= 3.0:
		shoot()
		total_delta = 0.0
	pass
