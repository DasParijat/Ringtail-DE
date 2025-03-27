extends Ringtail

@export var attack_min : int = 1
@export var attack_max : int = 4

func _process(delta: float) -> void:
	controller.action_handling(randi_range(attack_min, attack_max))
	pass
